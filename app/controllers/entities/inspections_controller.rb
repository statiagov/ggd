
class InspectionsController < EntitiesController
  before_action :get_data_for_sidebar, only: :index

  # GET /inspections
  #----------------------------------------------------------------------------
  def index
    @inspections = get_inspections(page: params[:page], per_page: params[:per_page])

    respond_with @inspections do |format|
      format.xls { render layout: 'header' }
      format.csv { render csv: @inspections }
    end
  end

  # GET /inspections/1
  # AJAX /inspections/1
  # XLS /inspections/1
  # XLS /inspections/1
  # CSV /inspections/1
  # RSS /inspections/1
  # ATOM /inspections/1
  #----------------------------------------------------------------------------
  def show
    respond_with(@campaign) do |format|
      format.html do
        @stage = Setting.unroll(:opportunity_stage)
        @comment = Comment.new
        @timeline = timeline(@campaign)
      end

      format.js do
        @stage = Setting.unroll(:opportunity_stage)
        @comment = Comment.new
        @timeline = timeline(@campaign)
      end

      format.xls do
        @leads = @campaign.leads
        render '/leads/index', layout: 'header'
      end

      format.csv do
        render csv: @campaign.leads
      end

      format.rss do
        @items  = "leads"
        @assets = @campaign.leads
      end

      format.atom do
        @items  = "leads"
        @assets = @campaign.leads
      end
    end
  end

  # GET /inspections/new
  # GET /inspections/new.json
  # GET /inspections/new.xml                                                 AJAX
  #----------------------------------------------------------------------------
  def new
    @inspection = Forms::Inspection::Scheduler.new
    if params[:related]
      model, id = params[:related].split('_')
      if related = model.classify.constantize.my.find_by_id(id)
        instance_variable_set("@#{model}", related)
      else
        respond_to_related_not_found(model) && return
      end
    end

    respond_with(@inspection) do |format|
      format.js
    end
  end

  # GET /inspections/1/edit                                                  AJAX
  #----------------------------------------------------------------------------
  def edit
    if params[:previous].to_s =~ /(\d+)\z/
      @previous = Campaign.my.find_by_id(Regexp.last_match[1]) || Regexp.last_match[1].to_i
    end

    respond_with(@campaign)
  end

  # POST /inspections
  #----------------------------------------------------------------------------
  def create
    @comment_body = params[:comment_body]

    respond_with(@campaign) do |_format|
      if @campaign.save
        @campaign.add_comment_by_user(@comment_body, current_user)
        @inspections = get_inspections
        get_data_for_sidebar
      end
    end
  end

  # PUT /inspections/1
  #----------------------------------------------------------------------------
  def update
    respond_with(@campaign) do |_format|
      # Must set access before user_ids, because user_ids= method depends on access value.
      @campaign.access = resource_params[:access] if resource_params[:access]
      get_data_for_sidebar if @campaign.update_attributes(resource_params) && called_from_index_page?
    end
  end

  # DELETE /inspections/1
  #----------------------------------------------------------------------------
  def destroy
    @campaign.destroy

    respond_with(@campaign) do |format|
      format.html { respond_to_destroy(:html) }
      format.js   { respond_to_destroy(:ajax) }
    end
  end

  # PUT /inspections/1/attach
  #----------------------------------------------------------------------------
  # Handled by EntitiesController :attach

  # PUT /inspections/1/discard
  #----------------------------------------------------------------------------
  # Handled by EntitiesController :discard

  # POST /inspections/auto_complete/query                                    AJAX
  #----------------------------------------------------------------------------
  # Handled by ApplicationController :auto_complete

  # GET /inspections/redraw                                                  AJAX
  #----------------------------------------------------------------------------
  def redraw
    # current_user.pref[:inspections_per_page] = params[:per_page] if params[:per_page]
    # current_user.pref[:inspections_sort_by]  = Inspection.sort_by_map[params[:sort_by]] if params[:sort_by]
    @inspections = get_inspections(page: 1, per_page: params[:per_page])
    set_options # Refresh options

    respond_with(@inspections) do |format|
      format.js { render :index }
    end
  end

  # POST /inspections/filter                                                 AJAX
  #----------------------------------------------------------------------------
  def filter
    session[:inspections_filter] = params[:status]
    @inspections = get_inspections(page: 1, per_page: params[:per_page])

    respond_with(@inspections) do |format|
      format.js { render :index }
    end
  end

  private

  #----------------------------------------------------------------------------
  alias_method :get_inspections, :get_list_of_records

  #----------------------------------------------------------------------------
  def respond_to_destroy(method)
    if method == :ajax
      get_data_for_sidebar
      @inspections = get_inspections
      if @inspections.blank?
        @inspections = get_inspections(page: current_page - 1) if current_page > 1
        render(:index) && return
      end
      # At this point render destroy.js
    else # :html request
      self.current_page = 1
      flash[:notice] = t(:msg_asset_deleted, @campaign.name)
      redirect_to inspections_path
    end
  end

  #----------------------------------------------------------------------------
  def get_data_for_sidebar
    @inspection_status_total = HashWithIndifferentAccess[
                             all: Inspection.count,
    ]
    Setting.inspection_states.each do |key|
      @inspection_status_total[key] = Inspection.in_state(key.to_s).count
    end
  end
end
