//
//  InterestingerApp.swift
//  Interestinger
//
//  Created by Micael Raste on 9.2.2024.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

@main
struct InterestingerApp: App {
    
    var chatClient: ChatClient = {
        var config = ChatClientConfig(apiKey: .init("xge76ueynktkm758jt2ba3f9nhy5km38s3kaqytswsfewty8aex2u3ngw375u2ew"))
        config.isLocalStorageEnabled = true
        config.applicationGroupIdentifier = "group.io.getstream.iOS.interestinger"

        // The resulting config is passed into a new `ChatClient` instance.
        let client = ChatClient(config: config)
        return client
    }()
    
    @State var streamChat: StreamChat?
    
    init() {
        var colors = ColorPalette()
        let SRBlue = UIColor(red: 125.0 / 255.0, green: 248.0 / 255.0, blue: 249.0 / 255.0, alpha: 1)
        colors.messageCurrentUserBackground = [SRBlue]
        colors.messageCurrentUserTextColor = .black
        var fonts = Fonts()
        fonts.footnoteBold = Font.footnote
        fonts.body = Font.title
        let images = Images()
        images.reactionLoveBig = UIImage(systemName: "heart.fill")!
        let channelNamer: ChatChannelNamer = { channel, currentUserId in
            "\(channel.name ?? "no name")"
        }

        
        let appearance = Appearance(colors: colors, images: images, fonts: fonts)

        let utils = Utils(channelNamer: channelNamer)

        streamChat = StreamChat(chatClient: chatClient, appearance: appearance, utils: utils)

        connectUser()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
    
    private func connectUser() {
        // This is a hardcoded token valid on Stream's tutorial environment.
        let token = try! Token(rawValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.kFSLHRB5X62t0Zlc7nwczWUfsQMwfkpylC6jCUZ6Mc0")
        
        // Call `connectUser` on our SDK to get started.
        chatClient.connectUser(
            userInfo: .init(
                id: "my-kull",
                name: "Micael Raste",
                imageURL: URL(string: "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yX3Bob3RvX29mX2FfYmxhY2tfYnVzaW5lc3NtYW5faXNvbGF0ZWRfb25fb2ZmX19lZmMxZDllNC1iNzQ5LTQ2NzMtYjRmMS1lYjI0NTBiYzNiOGRfMS5qcGc.jpg")!
            ),
            token: token
        ) { error in
            if let error = error {
                // Some very basic error handling only logging the error.
                log.error("connecting the user failed \(error)")
                return
            }
        }
    }
}
