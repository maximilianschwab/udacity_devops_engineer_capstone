#Examples from https://dev.to/po5i/how-to-add-basic-unit-test-to-a-python-flask-app-using-pytest-1m7a

def test_default_path(client):
    res = client.get('/')
    assert res.status_code == 200