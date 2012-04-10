{% extends "base.tpl" %}

{% block title %}{{ m.rsc[id].title }}{% endblock %}

{% block chapeau %}

	{% include "_article_chapeau.tpl" %}

{% endblock %}


{% block content %}

    <h1>{{ m.rsc[id].title }}</h1>

    {% if m.rsc[id].summary %}
    <p class="summary">
        {{ m.rsc[id].summary }}
    </p>
    {% endif %}

    {% if m.rsc[id].medium %}
    	<figure class="image-wrapper block-level-image">
			{% media m.rsc[id].medium width=445 crop class=align alt=m.rsc[id].title %}
		</figure>
    {% endif %}

    {{ m.rsc[id].body|show_media }}

	{% block below_body %}{% endblock %}


{% with m.search.paged[{query hassubject=[id, 'haspart']  sort='seq' pagelen=1 page=q.page}] as result %}
{% for id in result %}

{{ m.rsc[id].title }}

{% endfor %}
{% pager result=result dispatch='page' id=id %}

{% endwith %}

{% endblock %}
