import datetime
import random

from django.shortcuts import render_to_response
from rest_framework.response import Response
from rest_framework.decorators import api_view

from controllers import BlogController
from blog.models import Blog
from serializers import BlogSerializer

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


""" RESTFUL API """

# RESTFUL API for listing all articles
@api_view(['GET',])
def articles(request):
	articles, random_article = BlogController().get_articles()
	serializer = BlogSerializer(articles, many=True)
	articles = serializer.data
	serializer = BlogSerializer(random_article)
	random_article = serializer.data
	return Response({"articles": articles, "random": random_article})

# RESTFUL API for 'What to read next' section
@api_view(['GET',])
def next_articles(request):
	next_articles = BlogController().get_next_articles()
	serializer = BlogSerializer(next_articles, many=True)
	return Response(serializer.data)

# RESTFUL API for detailed view of one article
@api_view(['GET',])
def article(request, id):
	article = Blog.objects.get(id=id)
	serializer = BlogSerializer(article)
	return Response(serializer.data)

