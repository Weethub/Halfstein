{# /*============================================================================
  #Page breadcrumbs
==============================================================================*/
#Properties

#Breadcrumb
    //breadcrumbs_custom_class for custom CSS classes
#}

{% if breadcrumbs %}
    <div class="breadcrumbs {{ breadcrumbs_custom_class }} {% if template == 'category' %}mb-md-0 text-center text-md-left{% endif %}">
        <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">Home</a>
        
        {% if template == 'page' %}
            <span class="divider">|</span>
            <span class="crumb active">{{ page.name }}</span>

        {% elseif template == 'cart' %}
            <span class="divider">|</span>
            <span class="crumb active">{{ "Carrito de compras" | translate }}</span>

        {% elseif template == 'search' %}
            <span class="divider">|</span>
            <span class="crumb active">{{ "Resultados de búsqueda" | translate }}</span>

        {% elseif template == 'account.order' %}
            <span class="divider">|</span>
            <span class="crumb active">{{ 'Orden {1}' | translate(order.number) }}</span>
        {% else %}
            {% for crumb in breadcrumbs %}
                {% if not crumb.last %}
                    <span class="divider">|</span>
                    <a class="crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
                {% endif %}
            {% endfor %}
        {% endif %}
        
    </div>
{% endif %}
