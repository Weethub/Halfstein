{% if settings.bnn_promocional_desktop %}
    <section class="d-none d-md-block" style="margin-bottom: -4px;">
        {% for bnn in settings.bnn_promocional_desktop | slice(0, 1) %}
            {% if bnn.link %}<a href="{{ bnn.link }}">{% endif %}
                <img src="{{ bnn.image | static_url }}" class="img-fluid">
            {% if bnn.link %}</a>{% endif %}
        {% endfor %}
    </section>
{% endif %}

{% if settings.bnn_promocional_mobile %}
    <section class="d-md-none" style="margin-bottom: -4px;">
        {% for bnn in settings.bnn_promocional_mobile | slice(0, 1) %}
            {% if bnn.link %}<a href="{{ bnn.link }}">{% endif %}
                <img src="{{ bnn.image | static_url }}" class="img-fluid">
            {% if bnn.link %}</a>{% endif %}
        {% endfor %}
    </section>
{% endif %}