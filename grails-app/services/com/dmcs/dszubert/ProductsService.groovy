package com.dmcs.dszubert

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import groovy.util.logging.Slf4j
import org.example.SecUser
import org.springframework.security.core.userdetails.UserDetails

@Transactional
@Slf4j
class ProductsService {

    SpringSecurityService springSecurityService

    def saveProduct(String productId) {
        log.info("executing buy method");
        def product = Products.get(productId)
        log.info("product {}", product)
        product.addToBuyers(getUser())
        product.save()
    }

    def removeProductRelation(Products product) {
        SecUser.findAll().forEach{
            product.removeFromBuyers(it)
        }
        product.save()
    }

    List<Products> getUserCart(){
       return getUser().products.toList()
    }

    private SecUser getUser(){
        UserDetails currentUser = springSecurityService.principal
        def username = currentUser.getUsername()
        log.info("username {}" , username)
        return SecUser.findByUsername(username)
    }

    def removeProductFromCart(String productId){
        def product = Products.get(productId)
        product.removeFromBuyers(getUser())
        product.save()
    }
}
