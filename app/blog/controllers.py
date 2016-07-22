import datetime
import random
from blog.models import Blog

class BlogController:
	""" Controller class for Blog Model """

	def get_articles(self):
		""" 
			Gets all articles which are published, ordered by
			ascending order of date.
			Also, returns a random article from the list.
		"""
		articles = Blog.objects.all()\
			.filter(publication_date__lte=datetime.date.today())\
			.order_by('publication_date')
		i = random.randint(0, articles.count()-1)
		return articles, articles[i]

	def get_article(self, slug):
		""" Fetches the specified article """
		article = Blog.objects.get(slug=slug)
		return article

	def get_next_articles(self):
		""" 
			Fetches a random list of 4 articles for 
			What to Read Next section
		"""
		articles = Blog.objects.all()\
			.filter(publication_date__lte=datetime.date.today())\
			.order_by('publication_date')

		if articles.count() <= 4:
			return articles

		i, j, k, l = random.sample(range(0, articles.count()-1), 4)
		return [articles[i], articles[j], articles[k], articles[l]]



