{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}
<section class="section-newsletter-home mb-0 pt-5 pb-0">
    <div class="container py-3 py-md-0">
        <div class="row justify-content-center align-items-center">
                
            <div class="col-10 col-xl-3 pb-4 pb-xl-5">            
                <h3>{{ settings.newsletter_titulo }}</h3>
                <h4>{{ settings.newsletter_subtitulo }}</h4>             
            </div>
            
            <div class="col-10 col-xl-6 text-center">
                <form class="" method="post" action="/winnie-pooh" onsubmit="$(this).attr('action', '');">
                        <div class="input-append">
                          <div class="row align-items-center">
                            <div class="col-xl-6 pb-4 pb-xl-5">
                                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'name', type_text: true, input_name: 'name', input_id: 'name', input_placeholder: 'Nome', input_custom_class: "form-control-big" } %}
                                    {% block input_label_text %}{{ 'Nome' | translate }}{% endblock input_label_text %}
                                {% endembed %}
                            </div>
                            <div class="col-xl-6 pb-4 pb-xl-5">
                                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'E-mail', input_custom_class: "form-control-big" } %}
                                    {% block input_label_text %}{{ 'Email' | translate }}{% endblock input_label_text %}
                                {% endembed %}
                            </div>
                        </div>
                        <div class="winnie-pooh" style="display: none;">
                            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                        </div>
                        
                        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                        <input type="hidden" name="type" value="newsletter" />
                       
                        </div>
                    
            </div>
            <div class="col-10 col-xl-3 text-center pb-5">
                 <input type="submit" name="contact" class="btn newsletter-btn text-uppercase" value="Cadastrar!" />
            </div>
            </form>


			<div class="js-newsletter col-10 col-xl-12">
				{% if contact and contact.type == 'newsletter' %}
					{% if contact.success %}
						<div class="alert alert-success mb-5">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
					{% else %}
						<div class="alert alert-danger mb-5">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
					{% endif %}
				{% endif %}
			</div>

        </div>
    </div>
</section>