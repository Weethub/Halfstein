{% if settings.bnn_destaque_desktop %}
    <section class="d-none d-md-block" style="margin-bottom: -4px;">
        {% for bnn in settings.bnn_destaque_desktop | slice(0, 1) %}
            {% if bnn.link %}<a href="{{ bnn.link }}">{% endif %}
                <img src="{{ bnn.image | static_url }}" class="img-fluid w-100">
            {% if bnn.link %}</a>{% endif %}
        {% endfor %}
    </section>
{% endif %}

{% if settings.bnn_destaque_mobile %}
    <section class="d-md-none" style="margin-bottom: -4px;">
        {% for bnn in settings.bnn_destaque_mobile | slice(0, 1) %}
            {% if bnn.link %}<a href="{{ bnn.link }}">{% endif %}
                <img src="{{ bnn.image | static_url }}" class="img-fluid w-100">
            {% if bnn.link %}</a>{% endif %}
        {% endfor %}
    </section>
{% endif %}