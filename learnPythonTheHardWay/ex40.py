class Song(object):

    def __init__(self, lyrics):
        self.lyrics = lyrics

    def sing_me_a_song(self):
        for line in self.lyrics:
            print(line)

happy_bday = Song(["Happy birthday to you",
                    "I don't want to get sued",
                    "So I'll stop right there"])

bulls_on_parade = Song(["The rally around tha family",
                        "With pockets full so shells"])

happy_bday.sing_me_a_song()

bulls_on_parade.sing_me_a_song()



#Instead of naming your functions after what the function does, instead name it as if it's a command you are giving to the class

#When you write comments, describe why you are doing what you are doing
