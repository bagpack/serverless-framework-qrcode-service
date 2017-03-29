import base64
from io import BytesIO
import os
import sys

sys.path.append(os.path.join(os.path.abspath(os.path.dirname(__file__)), 'vendor'))
sys.path.append(os.path.join(os.path.abspath(os.path.dirname(__file__)), 'vendor/PIL'))

import qrcode  # noqa


def create(event, context):
    params = event['query']

    img = qrcode.make(params['text'])
    bufferd = BytesIO()
    stdout_buffer = getattr(sys.stdout, 'buffer', None)
    img.save(bufferd)
    image_base64 = base64.b64encode(bufferd.getvalue()).decode('utf-8')

    return image_base64
