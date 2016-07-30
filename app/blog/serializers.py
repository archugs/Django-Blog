from rest_framework import serializers
from models import Blog

# Serializer for Blog Model object
class BlogSerializer(serializers.Serializer):
	id = serializers.IntegerField()
	title = serializers.CharField()
	author = serializers.CharField()
	publication_date = serializers.DateField()
	category = serializers.CharField()
	image = serializers.CharField()
	optional_image = serializers.CharField()
	body = serializers.CharField()
	slug = serializers.CharField()
