{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>


{# Header #}

{% set show_transparent_head = template == 'home' and settings.head_transparent and settings.slider and not settings.slider is empty %}

<header class="js-head-main head-main head-{{ settings.head_background }} {% if settings.head_fix %}head-fix{% endif %} transition-soft {% if template == 'product' %}header-product{% endif %}" data-store="head">

    {# Topbar = Social + Advertising + Language #}

    {% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
    {% set has_languages = languages | length > 1 %}
    {% set has_ad_bar = settings.ad_bar and settings.ad_text %}
    {% set show_topbar =  has_ad_bar or has_social_network or has_languages %}

    {% if settings.letreiro %}
        <marquee speed="slow" behavior="loop">
            {{ settings.letreiro }}
        </marquee>
    {% endif %}


    <div class="container {% if settings.head_utility == 'searchbox' %}pb-0{% endif %}">

        <div id="header-comum" class="header-elements position-relative py-xl-2">
            <div class="{% if not settings.head_fix %}js-nav-logo-bar{% endif %} row align-items-center">
                
                <div class="col-6 col-md-2 offset-1 offset-md-0 d-flex justify-content-center justify-content-md-start col-logo-header order-2">
                    <a href="{{ store.url }}" class="link-logo-header">
                        <img class="img-fluid" src="{{ store.logo }}">
                    </a>
                </div>

                
                <div class="col-2 text-left d-block d-md-none order-1">
                {% if settings.head_utility == 'searchbox' %}
                        <a href="#" class="js-modal-open utilities-link utilities-item btn-menu-mobile" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}">
                            {% include "snipplets/svg/bars.tpl" with {svg_custom_class: "icon-inline icon-2x"}%}
                        </a>
                        {% if store.country == 'AR'%}
                            {# Notification icon for quick login on AR stores #}
                            <div class="js-quick-login-badge badge badge-overlap swing" style="display: none;"></div>
                        {% endif %}
                    {% else %}
                        <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
                            {% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline icon-2x"} %}
                        </a>
                    {% endif %}
                </div>
        
                <div class="col-5 p-0 d-none d-md-block col-nav-desktop order-md-1">{% snipplet "navigation/navigation.tpl" %}</div>

                <div class="col-md-2 offset-md-1 text-center col-search order-3 d-none d-md-block">
                    {% snipplet "header/header-search.tpl" %}
                </div>
                <div class="col-2 offset-1 offset-md-0 text-right col-utilities order-4">
                    {% snipplet "header/header-utilities.tpl" %}
                    {% if settings.head_fix and settings.ajax_cart %}
                        {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_mobile: true} %}
                    {% endif %}
                    
                </div>
            </div>
        </div>

        <div class="row align-items-center nav-row {% if settings.head_utility == 'searchbox' %}d-none d-md-block{% endif %}">
            {% if settings.head_utility == 'categories' %}
            <div class="col-2 d-block d-md-none p-0 text-center">
                <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}">
                    {% include "snipplets/svg/bars.tpl" with {svg_custom_class: "icon-inline icon-2x"}%}
                </a>
                {% if store.country == 'AR'%}
                    {# Notification icon for quick login on AR stores#}
                    <div class="js-quick-login-badge badge badge-overlap swing" style="display: none;"></div>
                {% endif %}
            </div>
            
            <div class="col-10 nav-categories-container d-block d-md-none p-0">
                {% snipplet "navigation/navigation-categories.tpl" %}
            </div>
            {% endif %}
            
        </div>

    </div>  



    {% include "snipplets/notification.tpl" with {order_notification: true} %}
</header>

{# Show cookie validation message #}
{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add notification for quick login cancellation #}

{% if template == 'home' or template == 'product' %}
    {% include "snipplets/notification.tpl" with {show_quick_login: true} %}
{% endif %}

{# Add notification for order cancellation #}

{% if store.country == 'AR' and template == 'home' and status_page_url %}
    {% include "snipplets/notification.tpl" with {show_order_cancellation: true} %}
{% endif %}

{# Add to cart notification for non fixed header #}

{% if not settings.head_fix and settings.ajax_cart %}
    {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}

{# Quick login modal #}

{% embed "snipplets/modal.tpl" with{modal_id: 'quick-login', modal_class: 'bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header: false, modal_footer: false, modal_width: 'centered', modal_zindex_top: true, modal_close_class: 'float-right mr-0'} %}
    {% block modal_body %}
        <div class="text-center h5 mt-3">{{ "¡Qué bueno verte de nuevo!" | translate }}</div>
        <div class="text-center p-2">{{ "Iniciá sesión para comprar más rápido y ver todos tus pedidos." | translate }}</div>
        {% embed "snipplets/forms/form.tpl" with{form_id: 'quick-login-form', form_action: '/account/login/', submit_custom_class: 'btn-block', submit_text: 'Iniciar sesión' | translate, data_store: 'account-login' } %}
            {% block form_body %}
                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: current_url, input_name: 'redirect_to'} %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: 'quick-login', input_name: 'from'} %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_value: result.email, input_name: 'email', input_custom_class: 'js-account-input', input_label_text: 'Email' | translate } %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'password', type_password: true, input_name: 'password', input_custom_class: 'js-account-input', input_help: true, input_help_link: store.customer_reset_password_url, input_link_class: 'btn-link-primary font-small float-right mb-4 mt-3n', input_label_text: 'Contraseña' | translate } %}{% endembed %}
            {% endblock %}
        {% endembed %}
    {% endblock %}
{% endembed %}

{# Hamburger panel #}

{% embed "snipplets/modal.tpl" with {modal_id: 'nav-hamburger',modal_class: 'nav-hamburger head-'~ settings.head_background ~ ' modal-docked-small', modal_position: 'left', modal_transition: 'fade', modal_width: 'full', modal_topbar: true  } %}
    {% block modal_topbar %}
        {% snipplet "navigation/navigation-topbar.tpl" %}
    {% endblock %}
    {% block modal_body %}
        {% snipplet "navigation/navigation-panel.tpl" %}
    {% endblock %}
{% endembed %}
{# Notifications #}

{# Modal Search #}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-search',modal_class: 'nav-search', modal_position: 'left', modal_transition: 'slide', modal_width: 'docked-md', modal_header: true } %}
    {% block modal_head %}
            {% block page_header_text %}{{ "Buscar" | translate }}{% endblock page_header_text %}
    {% endblock %}
    {% block modal_body %}
        {% snipplet "header/header-search.tpl" %}
    {% endblock %}
{% endembed %}

{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}           

    {# Cart Ajax #}

    {% embed "snipplets/modal.tpl" with{modal_id: 'modal-cart', modal_position: 'right', modal_transition: 'slide', modal_width: 'docked-md', modal_form_action: store.cart_url, modal_form_class: 'js-ajax-cart-panel', modal_header: true, modal_mobile_full_screen: true, modal_form_hook: 'cart-form' } %}
        {% block modal_head %}
            {% block page_header_text %}{{ "Carrito de Compras" | translate }}{% endblock page_header_text %}
        {% endblock %}
        {% block modal_body %}
            {% snipplet "cart-panel.tpl" %}
        {% endblock %}
    {% endembed %}

{% endif %}
