package com.dmcs.dszubert;

import java.util.Set;

import org.example.SecUser;

class Products{

	String name
	String description
	int price
	byte[] picture
	String pictureType

	static belongsTo = SecUser
	static hasMany = [buyers: SecUser]
	static constraints = {
		name unique: true
		picture(nullable:true, maxSize: 16384 /* 16K */)
		pictureType(nullable:true)
        buyers cascade : 'all-delete-orphan'
	}
}