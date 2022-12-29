import Cocoa
import Foundation
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "1.circle", accessibilityDescription: "1")
        }

        setupMenus()
    }

    func setupMenus() {
        // 1
        let menu = NSMenu()

        // 2
        let one = NSMenuItem(title: "Show Desktop", action: #selector(didTapOne) , keyEquivalent: "1")
        menu.addItem(one)

        let two = NSMenuItem(title: "bin", action: #selector(didTapTwo) , keyEquivalent: "2")
        menu.addItem(two)

        let three = NSMenuItem(title: "Cool", action: #selector(didTapThree) , keyEquivalent: "3")
        menu.addItem(three)

        menu.addItem(NSMenuItem.separator())

        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

        // 3
        statusItem.menu = menu
    }

    // 1
        private func changeStatusBarButton(number: Int) {
            if let button = statusItem.button {
                button.image = NSImage(systemSymbolName: "\(number).circle", accessibilityDescription: number.description)
            }
        }

        @objc func didTapOne() {
            changeStatusBarButton(number: 1)
            
            let currentApplication = NSRunningApplication.current
            let runningApplications = NSWorkspace.shared.runningApplications
            for application in runningApplications {
                if application != currentApplication {
                    application.hide()
                }
            }

        }

        @objc func didTapTwo() {
            changeStatusBarButton(number: 2)
        }

        @objc func didTapThree() {
            changeStatusBarButton(number: 3)
        }
}
