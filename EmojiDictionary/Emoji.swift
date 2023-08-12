//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Sara on 19/1/2023.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static var archiveURL : URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
        
        return archiveURL
    }
    
    static var sampleEmojis: [Emoji] {
        return [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "Happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "Unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.",
                  usage: "Love of something; attractive"),
            Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "Apps, software, programming"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "Good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "Spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "Taking a risk, chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "Camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.",
                  usage: "Homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "Extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "Tired, sleepiness"),
            Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "Completion"),
            Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "Person of authority"),
            Emoji(symbol: "🍰", name: "Cake slice", description: "A slice of vanilla cake with a strawberry on top", usage: "Cake"),
            Emoji(symbol: "👍", name: "Thumbs up", description: "A hand giving the thumbs up", usage: "Like, approval"),
            Emoji(symbol: "🦆", name: "Duck", description: "A duck with green feathers on its head and brown, grey, black and white on its body", usage: "Waddle, waddle"),
            Emoji(symbol: "🦄", name: "Unicorn", description: "A white unicorn with a pink mane", usage: "Highly desirable but hard to obtain")
        ] 
    }
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        do {
            let encodedEmoji = try propertyListEncoder.encode(emojis)
            try encodedEmoji.write(to: Emoji.archiveURL)
        } catch {
            print("Error encoding emojis: \(error)")
        }
    }
    
    static func loadFromFile() -> [Emoji]? {
        guard let emojiData = try? Data(contentsOf: Emoji.archiveURL) else {
            return nil
        }
        
        do {
            let propertyListDecoder = PropertyListDecoder()
            let decodedEmojis = try propertyListDecoder.decode([Emoji].self, from: emojiData)
            
            return decodedEmojis
        } catch {
            print("Error decoding emojis: \(error)")
            return nil
        }
        
    }
}

