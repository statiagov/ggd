

# Register the views that StatiaGov provides
#------------------------------------------------------------------------------

[{ name: 'contacts_index_brief', title: 'Brief format', icon: 'fa-bars',
   controllers: ['contacts'], actions: ['index'], template: 'contacts/index_brief' },
 { name: 'contacts_index_long', title: 'Long format', icon: 'fa-list',
   controllers: ['contacts'], actions: ['index'], template: 'contacts/index_long' }, # default index view
 { name: 'contacts_index_full', title: 'Full format', icon: 'fa-list-alt',
   controllers: ['contacts'], actions: ['index'], template: 'contacts/index_full' },
 { name: 'contacts_show_normal', title: 'Normal format', icon: 'fa-list',
   controllers: ['contacts'], actions: ['show'], template: nil }, # default show view

 { name: 'opportunities_index_brief', title: 'Brief format', icon: 'fa-bars',
   controllers: ['opportunities'], actions: ['index'], template: 'opportunities/index_brief' },
 { name: 'opportunities_index_long', title: 'Long format', icon: 'fa-list',
   controllers: ['opportunities'], actions: ['index'], template: 'opportunities/index_long' }, # default
 { name: 'opportunities_show_normal', title: 'Normal format', icon: 'fa-list',
   controllers: ['opportunities'], actions: ['show'], template: nil }, # default show view

 { name: 'accounts_index_brief', title: 'Brief format', icon: 'fa-bars',
   controllers: ['accounts'], actions: ['index'], template: 'accounts/index_brief' }, # default
 { name: 'accounts_index_long', title: 'Long format', icon: 'fa-list',
   controllers: ['accounts'], actions: ['index'], template: 'accounts/index_long' }, # default
 { name: 'accounts_show_normal', title: 'Normal format', icon: 'fa-list',
   controllers: ['accounts'], actions: ['show'], template: nil }, # default show view

 { name: 'leads_index_brief', title: 'Brief format', icon: 'fa-bars',
   controllers: ['leads'], actions: ['index'], template: 'leads/index_brief' }, # default
 { name: 'leads_index_long', title: 'Long format', icon: 'fa-list',
   controllers: ['leads'], actions: ['index'], template: 'leads/index_long' },
 { name: 'leads_show_normal', title: 'Normal format', icon: 'fa-list',
   controllers: ['leads'], actions: ['show'], template: nil }, # default show view

 { name: 'inspections_index_brief', title: 'Brief format', icon: 'fa-bars',
   controllers: ['inspections'], actions: ['index'], template: 'inspections/index_brief' }, # default
 { name: 'inspections_index_long', title: 'Long format', icon: 'fa-list',
   controllers: ['inspections'], actions: ['index'], template: 'inspections/index_long' },
 { name: 'inspections_show_normal', title: 'Normal format', icon: 'fa-list',
   controllers: ['inspections'], actions: ['show'], template: nil }, # default show view

].each { |view| StatiaGov::ViewFactory.new(view) }
