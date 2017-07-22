class SeedFaqs < ActiveRecord::Migration
  def up
    return unless Faq.count == 0
    faq_question_answers = ["What is beCamp?","beCamp is Charlottesville's version of the BarCamp unconference movement - a conference organized on the fly by attendees, for attendees."],
                           ["Who attends beCamp?","You! Software developers, system administrators, quality assurance, devops, designers, business developers and anyone interested in technology."],
                           ["When is beCamp?","beCamp begins Friday, September 15th, 2017 at 5:00PM for topic organization. beCamp continues Saturday, September 16th, 2017 at 9:00AM for presentations."],
                           ["Where is beCamp held?","beCamp is at a new location for 2016! beCamp will be held at Open Source Connections. <br> OpenSource Connections, 608 Preston Avenue, Charlottesville, VA. <br> <a href=\"https://www.google.com/maps/place/608+Preston+Ave,+Charlottesville,+VA+22903/@38.03502,-78.4886735,17z/data=!3m1!4b1!4m5!3m4!1s0x89b3862fe184a467:0x8e7ee00e4eb59b5e!8m2!3d38.03502!4d-78.4864848\">Google Maps</a>"],
                           ["How much does beCamp cost?","beCamp is free for attendees thanks to our awesome sponsors."],
                           ["What about food?","Food and beverages will be provided for the duration of the event."],
                           ["Are there rules?","beCamp draws people together from many backgrounds and experiences to learn and teach about technology. While you are at beCamp, help foster a friendly environment.<br> <ul> <li>be polite</li> <li>be kind</li> <li>be respectful</li> <li>be helpful</li> </ul> At beCamp, we do not tolerate offensive comments about gender, age, sexual orientation, disability, physical appearance, race, or religion, or any inappropriate physical contact. If a participant engages in harassing behavior, beCamp volunteers may take any action they deem appropriate, including warning the offender or expulsion from beCamp. Any participant who has a concern should bring it immediately to the beCamp organizer."],
                           ["Why is the schedule TBD?","The schedule will be made Friday night by attendees."],
                           ["How are topics decided?","On Friday evening, anyone in attendance can suggest topics for sessions held the following day. The suggester indicates whether it is a topic they'd like to present on, hold a group discussion on, or learn more about. After all the suggestions have been written down, they are placed on a wall and attendees mark the topics they are interested in. The suggestions that have the most votes are chosen as part of the conference schedule for the following day."],
                           ["What about topics that are not chosen?","Topics that are not chosen for the main scheduling blocks can still be presented as a five minute \"Lightning Talk\" where presenters can share their message with the other conference attendees. This Lightning Talk portion is held Saturday around lunch time, and may include talks that were not pitched on Friday night."],
                           ["How did beCamp get started?","The first beCamp was held in June 2007 when organizer Steve Stedman decided to hold a \"summer camp for geeks.\"<br> <a href=\"http://news.virginia.edu/content/uva-host-bleeding-edge-web-technology-unconference-june-15-16-charlottesvilles-first-ever\">UVA Today Article</a>"],
                           ["How can I help out with beCamp?","If you would like to help out, please <a href=\"mailto:itruett@gmail.com\">Contact Us</a>."]

    faq_question_answers.each_with_index do |faq_question_answer, index|
      Faq.create(question: faq_question_answer[0], answer: faq_question_answer[1], sequence: index * 10)
    end
  end
end
