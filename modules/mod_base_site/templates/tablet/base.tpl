<!DOCTYPE html>
{# Base TABLET/DESKTOP template (two columns) #}
<html lang="{{ z_language|default:"en"|escape }}">
<head>
	<meta charset="utf-8" />
	<title>{% block title %}{{ id.title }}{% endblock %} &mdash; {{ m.config.site.title.value }}</title>

	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="author" content="Marc Worrell" />

	{% all include "_html_head.tpl" %}
	{% lib 
	        "bootstrap/css/bootstrap.css" 
	        "bootstrap/css/bootstrap-responsive.css" 
	        "bootstrap/css/bootstrap-base-site.css" 
	%}
	{% block html_head_extra %}{% endblock %}
</head>

<body class="{% block page_class %}{% endblock %}">
{% block navbar %}
	{% include "_navbar.tpl" %}
{% endblock %}
<div class="container-fluid">
	{% block content_area %}
		<div class="content" {% include "_language_attrs.tpl" language=z_language %}>
		{% block content %}
			{% block above %}
				{% include "_breadcrumb.tpl" %}
				{% include "_title.tpl" %}
			{% endblock %}
			<div class="row-fluid">
				<div class="span8">
					{% block main %}{% endblock %}
				</div>

				<div id="subnavbar" class="span4">
					{# {% block sidebar %}{% include "_sidebar.tpl" %}{% endblock %} #}
					{% block subnavbar %}
						{% include "_content_list.tpl" list=id.o.hasdocument title=_"Documents"%}

						{% with id.o.haspart, id.s.haspart as sub,super %}
						{% if sub or super %}
							<h3>{_ Related _}</h3>
							{% include "_content_list.tpl" list=sub in_collection=id %}
							{% include "_content_list.tpl" list=super %}
						{% endif %}
						{% endwith %}
					{% endblock %}
				</div>
			</div>
			{% block below %}{% endblock %}
		{% endblock %}
		</div>
	{% endblock %}
	{% include "_footer.tpl" %}
</div>

{% include "_js_include.tpl" %}
{% script %}

{% block ua_probe %}
	{% include "_ua_probe.tpl"%}
{% endblock %}
</body>
</html>