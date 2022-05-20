{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}


<footer class="js-hide-footer-while-scrolling display-when-content-ready footer {% if template == 'product' %}footer-product{% endif %}">
	<div class="container">
		<div class="row element-footer mb-0">
			
			{# {% if template != 'password' %} #}


				<div class="col-12 pt-5 pb-4 col-menu-footer">
					{% include "snipplets/navigation/navigation-foot.tpl" %}
				</div>	


				<div class="col-12 col-md-3 pb-5 col-menu-pag">
					{% if has_shipping_payment_logos %}
					
						<div class="footer-payments-shipping-logos">
							{% if has_payment_logos %}
								<div class="mb-4">
									<h3 class="h3 mb-3">Formas de pagamento</h3>
									{% include "snipplets/logos-icons.tpl" with {'payments': true} %}
								</div>
							{% endif %}
							{% if has_shipping_logos %}	
								<div>
									<h3 class="h3 mb-3">Meios de envio</h3>
									{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}
								</div>																											
							{% endif %}
						</div>
						
					{% endif %}
				</div>



				<div class="col-12 col-md-2 pb-5">
					<h3 class="h3 mb-3">Certificados</h3>
					<img src="{{ 'images/_loja-segura.png' | static_url }}" class="img-fluid">
				</div>


				<div class="col-12 col-md-3 pb-5">

					<ul class="contact-info">
						{% if store.whatsapp %}
							<li class="contact-item ctt-item-wpp">{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-lg icon-w contact-item-icon"} %}<a href="{{ store.whatsapp }}" class="contact-link"><span class="whatsapp">{{ store.whatsapp }}</span></a></li>
						{% endif %}
						{% if store.phone %}
							<li class="contact-item">{% include "snipplets/svg/phone.tpl" with {svg_custom_class: "icon-inline icon-lg icon-w contact-item-icon"} %}<a href="tel:{{ store.phone }}" class="contact-link">{{ store.phone }}</a></li>
						{% endif %}
					</ul>

				</div>



				<div class="col-9 col-md-3 pb-5">

					{{ store.logo('small') | img_tag(store.name, {class: 'img-fluid d-block mb-3 mx-auto ml-md-0'}) | a_tag(store.url) }}

					<ul class="contact-info">
						{% if store.email %}
							<li class="contact-item">{% include "snipplets/svg/email.tpl" with {svg_custom_class: "icon-inline icon-lg icon-w contact-item-icon"} %}<a href="mailto:{{ store.email }}" class="contact-link">{{ store.email }}</a></li>
						{% endif %}
					</ul>

				</div>




				<div class="col-3 col-md-1 pb-5">

					<ul class="redes-sociais-rodape d-flex flex-wrap align-items-center justify-content-end mb-0 pl-0 list-unstyled">
						<li class="my-2">
							<a class="social-icon-rounded mb-0 d-flex align-items-center justify-content-center" href="{{ store.instagram }}" target="_blank">
								{% include "snipplets/svg/instagram.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
							</a>
						</li>
						{#
						<li class="my-2 ml-1">
							<a class="social-icon-rounded mb-0 d-flex align-items-center justify-content-center" href="{{ store.facebook }}" target="_blank">
								{% include "snipplets/svg/facebook.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
							</a>
						</li>
						#}
					</ul>
						
				</div>
			

			{# {% endif %} #}
		
		</div>
		
	</div>
	
	
	<div class="footer-legal">
		<div class="container">
			<div class="row pt-4">
				
				<div class="col-md-8 weethub text-center text-md-left pb-4 pb-md-2">
					<div class="texto-footer-legal">
						&copy; {{ date()|date('Y') }} | Todos os direitos reservados. 
						<span class="text-uppercase">{{ store.name }}</span>
						<span class="d-block d-md-inline-block mb-md-0 mb-1"></span>
						<span class="d-none d-md-inline-block">|</span>
						Feito com 

						<svg xmlns="http://www.w3.org/2000/svg" width="19.92" height="17.43" viewBox="0 0 19.92 17.43">
							<g transform="translate(-551.955 -1.189)">
								<path id="heart-solid" d="M17.974,33.159a5.32,5.32,0,0,0-7.26.529l-.766.79-.766-.79a5.32,5.32,0,0,0-7.26-.529,5.586,5.586,0,0,0-.385,8.088L9.065,49.02a1.22,1.22,0,0,0,1.762,0l7.528-7.773A5.583,5.583,0,0,0,17.974,33.159Z" transform="translate(551.967 -30.777)" />
							</g>
						</svg> pela <a href="https://weethub.com/?utm_source=Halfstein&utm_medium=linkrodape&utm_campaign=rodape" target="_blank">Weethub</a>
						| <a href="{{ store.url }}/politica-de-privacidade">Política de Privacidade</a>

					</div>
				</div>

				
				<div class="col-md-4 text-center text-md-right pb-4 pb-md-2">
					<span class="nuvem">{{ new_powered_by_link }}</span>
				</div>
	            
	        </div>
    	</div>
    </div>
	
</footer>