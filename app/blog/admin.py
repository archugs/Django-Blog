from django.contrib import admin
from blog.models import Blog

class BlogAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug": ("title",)}

# Register the models
admin.site.register(Blog, BlogAdmin)
