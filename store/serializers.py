from rest_framework import serializers

from store.models import Product


class ProductSerialiser(serializers.ModelSerializer):
    unit_price = serializers.DecimalField(max_digits=6, decimal_places=2)

    def validate_unit_price(self, value):
        if value <= 0.00:
            raise serializers.ValidationError("Unit price cannot be 0 or less.")
        return value

    class Meta:
        model = Product
        fields = ["id", "name", "description", "inventory", "unit_price", "collection", "category"]
        extra_kwargs = {
            "id": {"read_only": True},
            "inventory": {"min_value": 0},
        }
