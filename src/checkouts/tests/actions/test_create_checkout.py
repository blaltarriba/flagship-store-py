import pytest

from checkouts.actions import create_checkout

class TestCreateCheckout:
    def test_returns_id_when_checkout_is_created(self):
        assert create_checkout.execute("1234") == "Checkout created 1234"
