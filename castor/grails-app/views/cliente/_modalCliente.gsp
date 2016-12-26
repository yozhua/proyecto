<!-- Modal de actualizar riesgos-->
<div id="modalRiesgo" class="modal modal-wide fade" role="dialog" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="indicator"  id="guardando">
            <span class="spinner spinner1"></span>
        </div>  
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Cliente</h4>
            </div>
            <div class="modal-body" style="height:600px">
                <g:form  id="formEditar" url="[action:'save', controller:'cliente']" autocomplete="off">
                <!-- CONTENIDO DEL FORM-->

                <!-- FINAL DEL CONTENIDO DEL FORM-->
                </g:form>
            </div>
            <div class="modal-footer">
              
            </div>
        </div>
    </div>
</div>
