from rest_framework.generics import ListCreateAPIView, RetrieveAPIView
from rest_framework.viewsets import GenericViewSet

from store.models import Product
from store.serializers import ProductSerialiser

# Create your views here.


class ProductViewSet(GenericViewSet, ListCreateAPIView, RetrieveAPIView):
    serializer_class = ProductSerialiser
    queryset = Product.objects.all()

    def get_queryset(self):
        category = self.request.query_params.get("category")
        if category:
            return Product.objects.filter(category__icontains=category).all()
        return super().get_queryset()
