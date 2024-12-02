# BO3 Companion

This project is extremely old (end of 2015) and ultimately remained unfinished. While there are an uncountable amount of bad practices, I'm still proud of what I accomplished as I was still very new to Swift and iOS development. I was learning everything that I needed as I went. Start to finish on this project was about a month.

## Takeaways and Improvements
    Downloader.swift
When I think back about this project, this is the first thing that I think about. 
    
The main issue with this class (besides being a monolith, but it's not unique in that aspect) is the way in which it downloads the required files. Before this project, everything that I had made was completely local, so I encounted a steep learning curve. Due to having no experience in designing a back-end to serve files, this class downloads everything individually by directly accessing the link provided. If I were designing this now, I would take the time to learn how to collect and compress what's needed in an archive to send to the client instead of the current implementation.

The other main issue is the ```downloadDelegator``` function. The inclusion of this takes the class far out of the scope of what its name describes, and is ultimately what contributed to the class becoming bloated.

    Globals.swift
I believe the main reason for creating this class was because I wasn't sure how to pass data between view controllers, but I could be wrong. Either way, having random varibles be globally accessible is not the route that I should have chosen.

    Code Reusability
This issue plagues almost every file. If I had sought out better solutions, I could've cut the amount of code in the whole app to a fraction of what it ended up being. I now strive to create code that is much more concise and reusable.

##
