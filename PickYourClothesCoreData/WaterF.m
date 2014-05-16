//
//  WaterF.m
//  CollectionView
//
//  Created by d2space on 14-2-21.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import "WaterF.h"
//#import "WaterFLayout.h"
#import "showDetailview.h"
#import "WaterFallHeader.h"
#import "WaterFallFooter.h"

@interface WaterF ()

//@property (nonatomic, strong) WaterFCell* cell;
@end

@implementation WaterF

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self)
    {  
        [self.collectionView registerClass:[WaterFCell class] forCellWithReuseIdentifier:@"cell"];
      [self.collectionView registerClass:[WaterFallFooter class]  forSupplementaryViewOfKind:WaterFallSectionFooter withReuseIdentifier:@"WaterFallSectionfooter"];
     [self.collectionView registerClass:[WaterFallHeader class]  forSupplementaryViewOfKind:WaterFallSectionHeader withReuseIdentifier:@"WaterFallSectionHeader"];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
<<<<<<< HEAD
    self.collectionView.backgroundColor=[UIColor clearColor];
=======
    self.collectionView.backgroundColor=[UIColor whiteColor];
>>>>>>> FETCH_HEAD
    

    [self.collectionView setAllowsSelection:YES];
    
    

}

#pragma mark UICollectionViewDataSource
//required
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sectionNum;
}

/* For now, we won't return any sections */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return self.imagesArr.count;
   
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"cell";
    WaterFCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    CGFloat aFloat = 0;
    UIImage* image = self.imagesArr[indexPath.item];
    aFloat = self.imagewidth/image.size.width;
    cell.imageView.frame = CGRectMake(0, 0, self.imagewidth,  image.size.height*aFloat) ;
    
    
    
    
    [self getTextViewHeight:indexPath];
    cell.textView.frame = CGRectMake(0, image.size.height*aFloat+2, self.imagewidth, self.textViewHeight+10);

    cell.imageView.image = image;
    cell.cloth=self.clothes[indexPath.item];
    cell.textView.text = self.textsArr[indexPath.item];
    if (cell.cloth.onUse.boolValue) {
        UIImageView *selectdetail=[[UIImageView alloc] initWithFrame:CGRectMake(self.imagewidth-23, cell.imageView.frame.size.height-23, 20, 20)];
        UIImage *ima=[UIImage imageNamed:@"checked.png"];
        selectdetail.image=ima;
        [cell.imageView addSubview:selectdetail];
        
    }
    [cell setDelegate: self];
    return cell;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.index=indexPath;
<<<<<<< HEAD
=======
    NSLog(@"row= %i,section = %i",indexPath.item,indexPath.section);
>>>>>>> FETCH_HEAD
    
            
}
#pragma  addgesture

-(void) drawdetailpic:(Clothes *)cloth
{
<<<<<<< HEAD
=======
    //NSLog(@"delegate11%@",self.index);
>>>>>>> FETCH_HEAD
    
    [self.delegate updatecollectview:cloth];
    
    
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat aFloat = 0;
    UIImage* image = self.imagesArr[indexPath.item];
    aFloat = self.imagewidth/image.size.width;
     CGSize size = CGSizeMake(0,0);
    [self getTextViewHeight:indexPath];
     size = CGSizeMake(self.imagewidth, image.size.height*aFloat+self.textViewHeight);
    return size;
}

- (CGFloat)getTextViewHeight:(NSIndexPath*)indexPath
{
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self.textsArr[indexPath.item]];
    UITextView* textViewTemple = [[UITextView alloc]init];
    textViewTemple.attributedText = attrStr;
    textViewTemple.text = self.textsArr[indexPath.item];
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];   
    CGSize textSize = [textViewTemple.text boundingRectWithSize:CGSizeMake(self.imagewidth, MAXFLOAT)                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                     attributes:dic
                                                        context:nil].size;
    self.textViewHeight = textSize.height;
    return self.textViewHeight;
}

#pragma mark ADD Header AND Footer
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
   
    if ([kind isEqualToString:WaterFallSectionHeader])
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:@"WaterFallSectionHeader"
                                                                 forIndexPath:indexPath];
    }
    else if ([kind isEqualToString:WaterFallSectionFooter])
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:@"WaterFallSectionfooter"
                                                                 forIndexPath:indexPath];
    }
    
    return reusableView;
}
@end
