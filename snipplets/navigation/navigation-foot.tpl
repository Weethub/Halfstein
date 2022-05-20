<ul class="footer-menu">
	<li class="footer-menu-item d-block d-md-inline-block"><h3 class="h3">Institucional</h3></li>
	{% for item in menus[settings.footer_menu] %}
		<li class="footer-menu-item">
	        <a class="footer-menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		</li>
	{% endfor %}
</ul>