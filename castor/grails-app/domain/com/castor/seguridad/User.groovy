package com.castor.seguridad
import com.castor.empleado.Empleado
import com.castor.encargado.Encargado
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1	
	transient springSecurityService

	String username
	String email
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		email blank: false, email: true
		password blank: false, password: true
		username blank: false, unique: true
	}

	static mapping = {
		version false
		table '`user`'
		password column: '`password`'
	}	

	public User(String username,String password,String email){
		this()
		this.username=username		
		this.password=password
		this.email=email
	}
}

