#import "MenuItemSourceLinkView.h"
#import "MenusDesign.h"
#import "WPStyleGuide.h"
#import "WPFontManager.h"
#import "MenuItemCheckButtonView.h"

@interface MenuItemSourceLinkView ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) MenuItemSourceTextBar *textBar;
@property (nonatomic, strong) MenuItemCheckButtonView *checkButtonView;

@end

@implementation MenuItemSourceLinkView

- (id)init
{
    self = [super init];
    if(self) {
        
        {
            UILabel *label = [[UILabel alloc] init];
            label.translatesAutoresizingMaskIntoConstraints = NO;
            label.text = [NSLocalizedString(@"Link Address (URL)", @"Menus title label when editing a menu item as a link.") uppercaseString];
            label.textColor = [WPStyleGuide greyDarken10];
            label.font = [WPFontManager openSansSemiBoldFontOfSize:12.0];
            
            [self.stackView addArrangedSubview:label];
            self.label = label;
        }
        {
            MenuItemSourceTextBar *textBar = [[MenuItemSourceTextBar alloc] init];
            textBar.translatesAutoresizingMaskIntoConstraints = NO;
            textBar.delegate = self;
            [self.stackView addArrangedSubview:textBar];
            
            NSLayoutConstraint *heightConstraint = [textBar.heightAnchor constraintEqualToConstant:48.0];
            heightConstraint.priority = UILayoutPriorityDefaultHigh;
            heightConstraint.active = YES;
            
            [textBar setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
            self.textBar = textBar;
        }
        {
            MenuItemCheckButtonView *checkButtonView = [[MenuItemCheckButtonView alloc] init];
            checkButtonView.label.text = NSLocalizedString(@"Open link in new window/tab", @"Menus label for checkbox when editig item as a link.");
            [self.stackView addArrangedSubview:checkButtonView];
            
            NSLayoutConstraint *heightConstraint = [checkButtonView.heightAnchor constraintEqualToConstant:[checkButtonView preferredHeightForLayout]];
            heightConstraint.active = YES;
            
            self.checkButtonView = checkButtonView;
        }
    }
    
    return self;
}

- (BOOL)resignFirstResponder
{
    if([self.textBar isFirstResponder]) {
        return [self.textBar resignFirstResponder];
    }
    return [super resignFirstResponder];
}

@end