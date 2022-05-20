{% if is_order_cancellation %}
	{% set form_title = "Pedí la cancelación de tu última compra" | translate %}
{% else %}
	{% set form_title = "Fale Conosco" | translate %}
{% endif %}

{% set has_contact_info = store.whatsapp or store.phone or store.email or store.address or store.blog or store.contact_intro %} 
<section class="contact-page mb-0">
	<div class="container">

		<h1 class="titulo mb-5">{{ form_title }}</h1>

		<div class="row justify-content-md-center">
			{% if has_contact_info and not is_order_cancellation %}
				<div class="col-md-5 pb-5 order-12 order-md-0">

					<div class="info-pag-contato">
						<ul class="contact-info m-0 p-0">
							{% if store.whatsapp %}
								<li class="contact-item">{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-lg icon-w contact-item-icon"} %}<a href="{{ store.whatsapp }}" class="contact-link"><span class="whatsapp">{{ store.whatsapp }}</span></a></li>
							{% endif %}
							{% if store.phone %}
								<li class="contact-item">{% include "snipplets/svg/phone.tpl" with {svg_custom_class: "icon-inline icon-lg icon-w contact-item-icon"} %}<a href="tel:{{ store.phone }}" class="contact-link">{{ store.phone }}</a></li>
							{% endif %}
							{% if store.email %}
								<li class="contact-item">{% include "snipplets/svg/email.tpl" with {svg_custom_class: "icon-inline icon-lg icon-w contact-item-icon"} %}<a href="mailto:{{ store.email }}" class="contact-link">{{ store.email }}</a></li>
							{% endif %}
						</ul>
					</div>

				</div>
			{% endif %}
			{% if is_order_cancellation %}
				<div class="col-md-5 pb-5">
					<div class="text-center text-md-left mb-4">
						<p>{{ "Si te arrepentiste, podés pedir la cancelación enviando este formulario." | translate }} </p>
						<a class="btn-link-primary" href="{{ status_page_url }}"><strong>{{'Ver detalle de la compra >' | translate}}</strong></a>
					</div>
					{% if has_contact_info %}
						<h5 class="mb-1 mt-4">{{ 'Si tenés problemas con otra compra, contactanos:' | translate }}</h5>
                		<div class="divider mt-0"></div>
						{% if store.contact_intro %}
							<p class="mb-4">{{ store.contact_intro }}</p>
						{% endif %}
						{% include "snipplets/contact-links.tpl" %}
					{% endif %}
				</div>	
			{% endif %}
			<div class="col-md-7 pb-5 order-1">
				{% if product %}  
					<div class="mb-4">
						<div class="row align-items-center justify-content-md-left">
							<div class="col-auto">
								<img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
							</div>
							<div class="col-auto">
								<p>{{ "Estás consultando por el producto:" | translate }} </br> {{ product.name | a_tag(product.url) }}</p>
							</div>
						</div>
					</div>
				{% endif %}
				{% if contact %}
					{% if contact.success %}
						{% if is_order_cancellation %}
							<div class="alert alert-success">{{ "¡Tu pedido de cancelación fue enviado!" | translate }} 
							<br>
							<p class="mb-0 mt-2">{{ "Vamos a ponernos en contacto con vos apenas veamos tu mensaje." | translate }}</p>
							<br> 
							<strong>{{ "Tu código de trámite es" | translate }} #{{ last_order_id }}</strong></div>
						{% else %}
							<div class="alert alert-success">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
						{% endif %}
					{% else %}
						<div class="alert alert-danger">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
					{% endif %}
				{% endif %}	
				
				{% embed "snipplets/forms/form.tpl" with{form_id: 'contact-form', form_custom_class: 'js-winnie-pooh-form mb-4', form_action: '/winnie-pooh', submit_custom_class: 'btn-block', submit_name: 'contact', submit_text: 'Enviar' | translate, data_store: 'contact-form' }  %}
					{% block form_body %}

						{# Hidden inputs used to send attributes #}

						<div class="winnie-pooh hidden">
							<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
							<input type="text" id="winnie-pooh" name="winnie-pooh">
						</div>
						<input type="hidden" value="{{ product.id }}" name="product"/>

						{% if is_order_cancellation %}
							<input type="hidden" name="type" value="order_cancellation" />
						{% else %}
							<input type="hidden" name="type" value="contact" />
						{% endif %}

						{# Name input #}

						{% embed "snipplets/forms/form-input.tpl" with{type_text: true, input_name: 'name', input_placeholder: 'Nome' } %}
						{% endembed %}

						{# Email input #}

						{% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_name: 'email', input_placeholder: 'E-mail' } %}
						{% endembed %}

						{% if not is_order_cancellation %}

							{# Phone input #}

							{% embed "snipplets/forms/form-input.tpl" with{type_tel: true, input_name: 'phone', input_placeholder: 'Telefone' } %}
							{% endembed %}

							{# Message textarea #}

							{% embed "snipplets/forms/form-input.tpl" with{text_area: true, input_name: 'message', input_rows: '7', input_placeholder: 'Mensagem' } %}
							{% endembed %}

						{% endif %}
					{% endblock %}
				{% endembed %}
			</div>
		</div>
	</div>
</section>