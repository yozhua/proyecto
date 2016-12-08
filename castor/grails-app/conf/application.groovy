

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.castor.seguridad.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.castor.seguridad.UserRole'
grails.plugin.springsecurity.authority.className = 'com.castor.seguridad.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/logout/index',   access: ['permitAll']],	
	[pattern: '/login/auth',     access: ['permitAll']],
	[pattern: '/bitacora/index',     access: ['permitAll']],
	[pattern: '/bitacora/edit',     access: ['permitAll']],
	[pattern: '/bitacora/show',     access: ['permitAll']],
	[pattern: '/bitacora/create', access: ['permitAll']],
	[pattern: '/bitacora/find', access: ['permitAll']],
	[pattern: '/cliente/create', access: ['permitAll']],
	[pattern: '/cliente/edit', access: ['permitAll']],
	[pattern: '/user/restore_pass', access: ['permitAll']],
   	[pattern: '/user/send_email',   access: ['permitAll']],
    [pattern: '/user/change_pass',  access: ['permitAll']],
    [pattern: '/user/update_pass',  access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/empleado/create', access: ['permitAll']],
	[pattern: '/domicilioEmpleado/create', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]
