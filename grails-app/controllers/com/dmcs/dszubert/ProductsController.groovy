package com.dmcs.dszubert



import static org.springframework.http.HttpStatus.*

import org.example.SecUser;
import org.springframework.security.core.userdetails.UserDetails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.SpringSecurityUtils;
import grails.transaction.Transactional
import grails.web.RequestParameter

@Transactional(readOnly = true)
class ProductsController {

	SpringSecurityService springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Products.list(params), model:[productsInstanceCount: Products.count()]
    }
	def authenticateService
	def buy(){
		
		def product = Products.get(params.id)
		UserDetails currentUser = springSecurityService.principal
		def username = currentUser.getUsername()
		def secUser = SecUser.findByUsername(username)
        product.addToMembers(secUser).save()
        redirect (action:'index')
	}

    def show(Products productsInstance) {
        respond productsInstance
    }

    def create() {
        respond new Products(params)
    }

    @Transactional
    def save(Products productsInstance) {
        if (productsInstance == null) {
            notFound()
            return
        }

        if (productsInstance.hasErrors()) {
            respond productsInstance.errors, view:'create'
            return
        }

        productsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'products.label', default: 'Products'), productsInstance.id])
                redirect productsInstance
            }
            '*' { respond productsInstance, [status: CREATED] }
        }
    }

    def edit(Products productsInstance) {
        respond productsInstance
    }

    @Transactional
    def update(Products productsInstance) {
        if (productsInstance == null) {
            notFound()
            return
        }

        if (productsInstance.hasErrors()) {
            respond productsInstance.errors, view:'edit'
            return
        }

        productsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Products.label', default: 'Products'), productsInstance.id])
                redirect productsInstance
            }
            '*'{ respond productsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Products productsInstance) {

        if (productsInstance == null) {
            notFound()
            return
        }

        productsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Products.label', default: 'Products'), productsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'products.label', default: 'Products'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
