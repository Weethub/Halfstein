{% if settings.bnns_grid %}
    <section class="section-grade-banners" style="margin-bottom: -4px;">
        <ul class="list-unstyled m-0 p-0" id="grid-banners">
            {% for bnn in settings.bnns_grid | slice(0, 3) %}
                <li>
                    {% if bnn.link %}<a href="{{ bnn.link }}">{% endif %}
                        <img src="{{ bnn.image | static_url }}" class="img-fluid">
                    {% if bnn.link %}</a>{% endif %}
                </li>
            {% endfor %}
        </ul>
    </section>
{% endif %}