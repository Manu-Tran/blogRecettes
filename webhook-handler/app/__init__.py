from github_webhook import Webhook
from flask import Flask
import git

def create_app():
    app = Flask(__name__)   # Standard Flask app
    webhook = Webhook(app)  # Defines '/postreceive' endpoint
    gitRepo = git.Repo("/meta")
    o = gitRepo.remotes.origin
    gitRepo.heads.master.set_tracking_branch(o.refs.master)
    gitRepo.heads.master.checkout()

    @app.route("/")         # Standard Flask endpoint
    def on_get():
        o.fetch()
        print("Git repo updated !")
        return "Git repo updated !"


    @webhook.hook()         # Defines a handler for the 'push' event
    def on_push(data):
        print("Got push with: {0}".format(data))
        o.fetch()
        gitRepo.git.clean("-f")
        gitRepo.git.reset("--hard", "origin/master")
        print("Git repo updated !")
        return "Git repo updated !"
    return app
