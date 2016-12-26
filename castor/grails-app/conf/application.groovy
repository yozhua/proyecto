


// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.castor.seguridad.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.castor.seguridad.UserRole'
grails.plugin.springsecurity.authority.className = 'com.castor.seguridad.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',       access: ['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_TECNICO','ROLE_GERENCIA','ROLE_CLIENTE']],
	[pattern: '/**',     access: ['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_TECNICO','ROLE_GERENCIA','ROLE_CLIENTE']],
	[pattern: 'index',     access: ['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_TECNICO','ROLE_GERENCIA','ROLE_CLIENTE']],
	[pattern: 'index.gsp',     access: ['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_TECNICO','ROLE_GERENCIA','ROLE_CLIENTE']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],	
	[pattern: '/login/auth',     access: ['permitAll']],
	[pattern: '/user/restore_pass',     access: ['permitAll']],
	[pattern: '/user/change_pass',     access: ['permitAll']],
	[pattern: '/login/auth',     access: ['permitAll']],
	[pattern: '/logout/index',     access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]
