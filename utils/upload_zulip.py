from pathlib import Path
import zulip
import logging
from typing import Any


class FileToUpload:
    path: Path
    truncate_length: int = 100
    blurb: str

    def __init__(self, blurb: str, path: Path, truncate_length: int):
        self.blurb = blurb
        self.path = path
        self.truncate_length = truncate_length


class AttachmentToUpload:
    path: Path
    name: str

    def __init__(self, name: str, path: Path):
        self.name = name
        self.path = path


class ImageToUpload:
    path: Path
    blurb: str

    def __init__(self, blurb: str, path: Path):
        self.blurb = blurb
        self.path = path


class InfoToUpload:
    text: str

    def __init__(self, text: str):
        self.text = text


class Client:
    client: zulip.Client

    def __init__(self, config_file_path):
        self.client = zulip.Client(config_file=config_file_path)

    @classmethod
    def check_result(cls, out):
        if out["result"] == "error":
            logging.error(f"result {out} failed")
        return out

    def upload_file(self, file_path: Path):
        with open(file_path, "rb") as f:
            result = Client.check_result(self.client.upload_file(f))
        logging.info(f"uploaded '{file_path}' with result '{result}'")
        return result["url"]

    def send_message(self, message: dict[str, Any]):
        _result = self.client.send_message(message)
        print(f"send_message result: {_result}")


class ContentBuilder:
    files_to_upload: list[FileToUpload]
    attachments_to_upload: list[AttachmentToUpload]
    images_to_upload: list[ImageToUpload]
    info_to_upload: list[InfoToUpload]

    def __init__(self):
        self.files_to_upload: list[FileToUpload] = []
        self.images_to_upload: list[ImageToUpload] = []
        self.info_to_upload: list[InfoToUpload] = []
        self.attachments_to_upload: list[AttachmentToUpload] = []

    def add_file(self, blurb: str, path: Path, truncate_length: int = 20):
        self.files_to_upload.append(FileToUpload(blurb, path, truncate_length))

    def add_image(self, blurb: str, path: Path):
        self.images_to_upload.append(ImageToUpload(blurb, path))

    def add_attachment(self, name: str, path: Path):
        self.attachments_to_upload.append(AttachmentToUpload(name, path))

    def add_info(self, text: str):
        self.info_to_upload.append(InfoToUpload(text))

    def build(self, client: Client) -> str:
        out = "# Eval results\n"

        out += "## Configuration\n"
        for info in self.info_to_upload:
            out += f"- {info.text}\n"

        out += "## Images\n"
        for image in self.images_to_upload:
            uri = client.upload_file(image.path)
            # out += f"**{image.blurb}**\n"
            out += f"[{image.blurb}]({uri})\n"
            out += "\n"
        return out
