from __future__ import unicode_literals
import datetime

from django.db import models
from django.db.models import permalink

class Blog(models.Model):
	""" Blog Model object corresponding to blog table """

	id = models.AutoField(primary_key=True)
	title = models.CharField(max_length=100, unique=True)
	author = models.CharField(max_length=100, db_index=True)
	publication_date = models.DateField(db_index=True, default=datetime.date.today())
	category = models.CharField(max_length=100)
	image = models.CharField(max_length=100)
	optional_image = models.CharField(max_length=100)
	body = models.TextField()
	slug = models.SlugField(unique=True)

	def __unicode__(self):
		return '%s' % self.title
	
	@permalink
	def get_absolute_url(self):
		""" Returns absolute url of the blog post """
		return ('view_blog_post', None, { 'slug': self.slug })

	def get_image(self):
		""" Returns path of the image for blog """
		return "/static/images/" + self.image
	
	def get_optional_image(self):
		""" Returns path of the optional image for blog """
		if self.optional_image:
			return "/static/optional_images/" + self.optional_image
		else:
			return None
