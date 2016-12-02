package com.castor.cliente

import grails.test.mixin.*
import spock.lang.*

@TestFor(TipoSucursalController)
@Mock(TipoSucursal)
class TipoSucursalControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.tipoSucursalList
            model.tipoSucursalCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.tipoSucursal!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def tipoSucursal = new TipoSucursal()
            tipoSucursal.validate()
            controller.save(tipoSucursal)

        then:"The create view is rendered again with the correct model"
            model.tipoSucursal!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            tipoSucursal = new TipoSucursal(params)

            controller.save(tipoSucursal)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/tipoSucursal/show/1'
            controller.flash.message != null
            TipoSucursal.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def tipoSucursal = new TipoSucursal(params)
            controller.show(tipoSucursal)

        then:"A model is populated containing the domain instance"
            model.tipoSucursal == tipoSucursal
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def tipoSucursal = new TipoSucursal(params)
            controller.edit(tipoSucursal)

        then:"A model is populated containing the domain instance"
            model.tipoSucursal == tipoSucursal
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/tipoSucursal/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def tipoSucursal = new TipoSucursal()
            tipoSucursal.validate()
            controller.update(tipoSucursal)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.tipoSucursal == tipoSucursal

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            tipoSucursal = new TipoSucursal(params).save(flush: true)
            controller.update(tipoSucursal)

        then:"A redirect is issued to the show action"
            tipoSucursal != null
            response.redirectedUrl == "/tipoSucursal/show/$tipoSucursal.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/tipoSucursal/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def tipoSucursal = new TipoSucursal(params).save(flush: true)

        then:"It exists"
            TipoSucursal.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(tipoSucursal)

        then:"The instance is deleted"
            TipoSucursal.count() == 0
            response.redirectedUrl == '/tipoSucursal/index'
            flash.message != null
    }
}
