---
title: "A Rails Developer Spends One Week With Merb (and HAML and JQuery and DataMapper)"
layout: post
category: programming
published: true
---
Developers often talk about some hot new technology they plan on spending time with, but very rarely do they ever get around to it.  I'm ordinarily in the same boat, but last week I had a new personal project crop up for a simple web application (5-6 models) which was an ideal candidate for testing out a slew of new tech that I've been meaning to get around to.

[Merb](http://www.merbivore.com/), an erstwhile competitor to Rails, has been making a big splash lately.  I decided to step out of my comfort zone of Rails/Acti* and into the wild and woolly world of young, cutting-edge frameworks.  Since I'm undergoing the pain of learning a new framework, I figured I'd go whole hog and use [Haml](http://haml.hamptoncatlin.com), [jQuery](http://jquery.com/), and [DataMapper](http://datamapper.org/doku.php), as well.

Before last week, I'd never done much more than spin through the initial tutorials for any of these tools.  That being the case, I can't really speak to performance, deployment, or any of half-a-hundred other critical issues to consider when selecting a framework-- this is strictly a shallow, first-impressions review.

I welcome comments and corrections to my observations, and suggestions for easing some of the new-developer pain.

<!-- read more -->
# [Merb](http://www.merbivore.com/)
Having only recently reached 1.0, Merb's still a bit rough around the edges.  Documentation and tutorials are sparse, and there are a few API decisions that feel odd, but all that's to be expected.

Fortunately, a Rails developer will have no trouble whatsoever translating their experience wholesale over to Merb.  Everything feels familiar and works as expected.  Even some Rails functions which are not documented anywhere in Merb (such as 'cycle') are present and work as expected.

Overall, using Merb is a reasonably pain-free experience and follows the <abbr title="Principle of Least Surprise">POLS</abbr>, with a few minor exceptions.

Most surprising so far is that there is no (evident) standardized way to handle resources with uncountable names.  Merb eschews Rails' "-Controller" addendum for class names, separating models and controllers strictly by pluralization.  You'll run into naming collisions with uncountable class names ("Series", for example).  This is not difficult to fix, but it's a surprising oversight for someone used to the smooth Rails development process.

The app I'm building will only have two or three users, so performance is not a major concern at this point (I may even leave the database in sqlite3).  I *will* say that Merb starts up like a screaming banshee compared to Rails, which is good, since you'll be restarting a *lot* during development.  

Merb automatically reloads when you modify a model or controller file, but not when you modify a view file.  I know there's a perfectly rational reason behind this, but it can be frustrating, since the view templates are something to I do a lot of "minor tweak->restart->check" to.  Additionally, I tend to do a lot of exploratory testing of my model code in the console, and the automatic restarts don't save me much time, but they do wipe out my command history, so I need to keep my cut-n-paste skills sharp or else retype a lot of testing code.

A last nitpick is that the community doesn't seem quite as friendly or responsive as Rails'.  It's one of those somewhat understandable but still frustrating experiences-- yes, it's open-source, I can patch-and-submit, etc., but when I'm having a problem *right now,* I'm not interested in hacking the framework-- *especially* if it's likely that only my ignorance causing the problem.  I generally try very hard to work things out on my own before making a ticket or jumping into IRC, precisely because I know how difficult and ungratifying it can be to keep up with support requests.  The responses, especially on the tickets, do not always seem carefully thought out.

That said, there is much to love about Merb.  A few killer (for me) features create a much more pleasant development experience than Rails.  Some that stood out:

* RSpec is the default testing framework.  This is long overdue in Rails-- not having to jump through the install-gem-and-plugin-and-wait-what-version-of-rails hoops just to use RSpec is a huge burden gone.
* Using a different ORM or view templating system requires changing only a single line of code (well, that and installing the 49 gems that get it running).  This is much nicer then Rails' heavy and largely immovable dependencies.
* Specs are broken out into only two areas: models and requests.  The use of 'requests' eliminates the often-fuzzy line between controller and fragile view specs.

Overall, Merb feels much cleaner and less crufty than Rails.

Shortly after I started working with Merb, the merge with Rails was announced.  I'm ambivalent about it at the moment, but hopefully the Merb side will pick up the stability and smoothness of the Rails process (and some of the Rails community), and Rails can pick up many of Merb's new concepts.

# [Haml](http://haml.hamptoncatlin.com/)
I've never been comfortable with ERb templates.  They smack of the raw string replacement philosophy of classic ASP.  I've long suspected that there must be a better way to handle view templating, but had no real idea how it could be accomplished.  Haml is one of the first systems I've seen to take a reasonable stab at this problem.

Haml was a solid win across the board.  It's stable, works exactly as advertised, and beats the pants off of ERb.  Documentation is complete and effective.  I can't speak about the support community, since I didn't have a single question that wasn't answered almost immediately by the documentation.  

Really, I don't know what better to say about a piece of software than "it worked well, cleaned up my code, and saved me a bunch of headaches."

It does take a little while to get your head into, but once you're there it's very intuitive and flows naturally if you're familiar with basic css selectors.  It's whitespace-sensitive (like Python), which eliminates a lot of the nesting you end up doing in ERb, and keeps your view templates looking nice.

Some folks have an inexplicable aversion to whitespace-sensitivity: if you're one of them, then you will definitely not like Haml.

Nonetheless, I think that nearly anyone who follows the advice on Haml's homepage and takes twenty minutes to convert one of their existing ERb templates (the uglier the better) will be a convert.

For any future projects where it's possible, I'll be using Haml.

# [jQuery](http://jquery.com/)
I'll admit that I've openly derided the concept of "unobtrusive javascript," which is a core concept of the jQuery library.  This is one case where I was utterly, embarrassingly, and happily wrong.

I don't have much client-side AJAXy fanciness going on, but having all the javascript code out of my way made development much easier, and the maintenance is clearly going to be less of a burden.

jQuery's DOM handling is very clear, and there's a surprising amount of flexibility and power easily available once you start digging into it.

I still don't *like* javascript, but jQuery makes it much, much more tolerable.

# [DataMapper](http://www.datamapper.org/)
DataMapper was the biggest disappointment of the lot.  I'd seen a presentation and played with it a bit.  I was very excited about it, because there are some very good ideas in DataMapper.  Unfortunately, the actual implementation is a bit of a train wreck.

The last time I used it, nearly a year ago, I was trying to tie it to CouchDB.  At the time, I wrote off my difficulties as 1) my limited understanding of DataMapper, and 2) trying to shoehorn a document database into a relational ORM with an incomplete library.

I'm sorry to report that the "correct" DataMapper experience is not significantly better.  Documentation and examples are painfully sparse, and several pieces simply don't work well.  Validation could not be made to function consistently, and associations are fraught with guesswork, when they work at all.

At one point, after four hours of frustration, I turned to IRC, where an admittedly helpful and pleasant person informed me that many-to-many associations in DataMapper are broken for a number of edge cases, and probably shouldn't be used.  I indicated, in the nicest way I could manage, that this should probably be displayed somewhere prominent on DataMapper's website.

The API is still in flux, so the few tutorials and examples that Google finds are likely as not to be out of date.  It's not hard to work around many of the missing or broken features, but the resultant code is slow to write, ugly to look at, and feature-incomplete.

DataMapper was so sharply disappointing precisely because it shows so much promise.  Much of the silliness of ActiveRecord is leapfrogged entirely-- things like counts and association loading are handled in a more rational way, slimming the API and boosting performance.

My understanding is that they're in the midst of an extended rewrite, and there are parts of the API (especially surrounding the problematic associations) that are under review for changes.  Hopefully they will be able to turn the quality around; the 0.9.8 version number belies the incompleteness of the library.

# [RSpec Bonus!](http://rspec.info/) 5% more verbiage FREE
RSpec is a beautiful thing.  If you aren't you using it already, you are missing out on faster, more effective testing.  As testing frameworks go, RSpec is one of the best.

Others have stated more eloquently why **You.should be\_using\_rspec**

# Overall

I hope I don't give the impression here that working with Merb and cohorts is at all unpleasant-- quite the opposite.  It's far easier to burn up the wordcount criticizing flaws than it is saying "Works great," and make no mistake that nearly everything works great.  Despite having not yet spent much time with these tools, I already have a comfortable workflow, and I certainly wouldn't be continuing development if the benefits these tools provide didn't outweigh the nitpicks I've been running into.

Merb is not the revolutionary leap that Rails was, but it's a clear evolutionary step.  Despite some roughness in a few places, it's a great system to work with, and I look forward to good things coming out of Merb's and Rails' merge.

