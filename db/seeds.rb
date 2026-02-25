# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Clearing existing data..."
Post.destroy_all
Topic.destroy_all
User.destroy_all

puts "Creating users..."
default_user = User.create!(email_address: "user@example.com", password: "password")
users = [
  default_user,
  User.create!(email_address: "alice@example.com", password: "password"),
  User.create!(email_address: "bob@example.com", password: "password"),
  User.create!(email_address: "carol@example.com", password: "password"),
  User.create!(email_address: "dave@example.com", password: "password")
]
puts "  Default login: user@example.com / password"

puts "Creating topics..."
topics = [
  Topic.create!(name: "programming", user: users[0]),
  Topic.create!(name: "career-advice", user: users[1]),
  Topic.create!(name: "code-review", user: users[2]),
  Topic.create!(name: "tech-news", user: users[3]),
  Topic.create!(name: "side-projects", user: users[4]),
  Topic.create!(name: "learning-resources", user: users[0])
]

puts "Creating posts..."
posts_data = [
  {
    title: "Finally switched from VS Code to Neovim",
    content: "After 3 years of using VS Code, I decided to give Neovim a serious try. The learning curve was steep for the first two weeks, but now I can't imagine going back. My workflow is so much faster, and the customization options are incredible. Anyone else made the switch?",
    likes: 142,
    dislikes: 23,
    topic: topics[0],
    user: users[0]
  },
  {
    title: "How I negotiated a 40% raise by switching jobs",
    content: "I was underpaid at my previous company for years. Finally decided to interview around and got multiple offers. Used them as leverage and ended up with a 40% increase. The key was knowing my market value and being willing to walk away. Happy to answer questions about the process.",
    likes: 389,
    dislikes: 12,
    topic: topics[1],
    user: users[1]
  },
  {
    title: "Review my authentication implementation?",
    content: "I'm building a Rails app and implemented JWT authentication from scratch. Before I deploy to production, I'd love some experienced eyes on the code. Specifically concerned about token refresh logic and session management. Link to PR in comments.",
    likes: 45,
    dislikes: 3,
    topic: topics[2],
    user: users[2]
  },
  {
    title: "OpenAI announces GPT-5 with real-time reasoning",
    content: "Just announced at DevDay: GPT-5 features significantly improved reasoning capabilities and can now process information in real-time. Early benchmarks show 3x improvement on complex coding tasks. API access rolling out next month.",
    likes: 567,
    dislikes: 34,
    topic: topics[3],
    user: users[3]
  },
  {
    title: "Launched my side project after 6 months of work",
    content: "Finally shipped! It's a tool that helps developers track their coding habits and suggests improvements. Built with Rails, Hotwire, and a bit of ML for the suggestions. Would love feedback from the community. It's free during beta.",
    likes: 234,
    dislikes: 8,
    topic: topics[4],
    user: users[4]
  },
  {
    title: "Best resources for learning system design in 2024",
    content: "I've compiled a list of the best system design resources I've found: 1) Designing Data-Intensive Applications (book), 2) System Design Primer on GitHub, 3) ByteByteGo YouTube channel, 4) Educative.io courses. What would you add to this list?",
    likes: 445,
    dislikes: 5,
    topic: topics[5],
    user: users[0]
  },
  {
    title: "Why I stopped chasing FAANG and joined a startup",
    content: "Spent 2 years grinding LeetCode to get into Google. Got the offer, but realized the startup I was already at offered more growth, ownership, and honestly better compensation when you factor in equity. Sometimes the grass isn't greener.",
    likes: 278,
    dislikes: 67,
    topic: topics[1],
    user: users[2]
  },
  {
    title: "Rust is eating the world, and I'm here for it",
    content: "Cloudflare, Discord, Figma, AWS - everyone is rewriting performance-critical systems in Rust. Just finished porting our Python microservice and saw 10x throughput improvement. The memory safety guarantees alone are worth the learning curve.",
    likes: 312,
    dislikes: 89,
    topic: topics[0],
    user: users[3]
  },
  {
    title: "Built a CLI tool that generates commit messages with AI",
    content: "Got tired of writing commit messages, so I built a CLI that analyzes your staged changes and generates conventional commit messages. It's open source and works with any Git repo. Uses local LLMs so no API costs.",
    likes: 189,
    dislikes: 15,
    topic: topics[4],
    user: users[1]
  },
  {
    title: "The hidden cost of microservices nobody talks about",
    content: "We migrated from a monolith to microservices 2 years ago. The cognitive overhead is real. Debugging distributed systems, managing 47 repos, deployment complexity... For most teams under 50 engineers, a well-structured monolith is probably the right choice.",
    likes: 523,
    dislikes: 41,
    topic: topics[0],
    user: users[4]
  }
]

posts_data.each do |post_data|
  Post.create!(post_data)
end

puts "Seeding complete!"
puts "  - #{User.count} users"
puts "  - #{Topic.count} topics"
puts "  - #{Post.count} posts"