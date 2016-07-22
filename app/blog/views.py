from django.shortcuts import render_to_response
from controllers import BlogController

# Article List Page
def index(request):
	articles, random_article = BlogController().get_articles()
	next_articles = BlogController().get_next_articles()
	return render_to_response('index.html', {
        'articles': articles,
		'random': random_article,
		'next_articles': next_articles
    })

# Article Detail Page
def view_post(request, slug):   
	article = BlogController().get_article(slug=slug)
	next_articles = BlogController().get_next_articles()
	return render_to_response('article.html', {
		'article': article,
		'next_articles': next_articles
	})
