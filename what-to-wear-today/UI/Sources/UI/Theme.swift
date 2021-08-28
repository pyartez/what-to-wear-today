//
//  Theme.swift
//  
//
//  Created by Phil Yates on 14/07/2021.
//

import SwiftUI

public struct CurrentTheme: EnvironmentKey {
    public static var defaultValue: Theme {
        let palette = Palette(
            primary: Color.black,
            secondary: Color.black,
            background: Color.black,
            surface: Color.gray,
            onPrimary: Color.white,
            onSecondary: Color.white,
            onSurface: Color.white,
            onSurfaceSecondary: Color.gray,
            error: Color.red
        )
        
        let typography = Typography(
            h1: .largeTitle,
            h2: .title,
            h3: .title2,
            h4: .title3,
            subTitle1: .headline,
            subTitle2: .subheadline,
            body: .body,
            caption: .caption,
            button: .body,
            overline: .footnote
        )
        
        let theme = Theme(
            color: palette,
            font: typography,
            bundle: .module
        )
        return theme
    }
}

public extension EnvironmentValues {
    var theme: Theme {
        get {
            self[CurrentTheme.self]
        }
        set {
            self[CurrentTheme.self] = newValue
        }
    }
}

public struct Palette {
    public let primary: Color
    public let secondary: Color
    public let background: Color
    public let surface: Color
    public let onPrimary: Color
    public let onSecondary: Color
    public let onSurface: Color
    public let onSurfaceSecondary: Color
    public let error: Color
    
    public init(primary: Color,
                secondary: Color,
                background: Color,
                surface: Color,
                onPrimary: Color,
                onSecondary: Color,
                onSurface: Color,
                onSurfaceSecondary: Color,
                error: Color) {
        
        self.primary = primary
        self.secondary = secondary
        self.background = background
        self.surface = surface
        self.onPrimary = onPrimary
        self.onSecondary = onSecondary
        self.onSurface = onSurface
        self.onSurfaceSecondary = onSurfaceSecondary
        self.error = error
    }
}

public struct Typography {
    public let h1: Font
    public let h2: Font
    public let h3: Font
    public let h4: Font
    
    public let subTitle1: Font
    public let subTitle2: Font
    
    public let body: Font
    
    public let caption: Font
    public let button: Font
    
    public let overline: Font
    
    public init(h1: Font,
                h2: Font,
                h3: Font,
                h4: Font,
                subTitle1: Font,
                subTitle2: Font,
                body: Font,
                caption: Font,
                button: Font,
                overline: Font) {
        
        self.h1 = h1
        self.h2 = h2
        self.h3 = h3
        self.h4 = h4
        
        self.subTitle1 = subTitle1
        self.subTitle2 = subTitle1
        
        self.body = body
        
        self.caption = caption
        self.button = button
        
        self.overline = overline
    }
}

public struct Theme {
    public let color: Palette
    public let font: Typography
    public let bundle: Bundle
    
    public init(color: Palette, font: Typography, bundle: Bundle) {
        self.color = color
        self.font = font
        self.bundle = bundle
    }
}
