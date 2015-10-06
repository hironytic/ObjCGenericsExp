//
//  ViewController.m
//  GenericsExp1
//
//  Created by Hironori Ichimiya on 2015/10/06.
//  Copyright © 2015年 Hironytic. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "Queue.h"
#import "Handler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    Queue<Animal *> *animalQueue = [[Queue<Animal *> alloc] initWithArray:@[
        [[Cat alloc] initWithName:@"ミケ"],
        [[Cat alloc] initWithName:@"タマ"],
        [[Dog alloc] initWithName:@"平九郎"],
    ]];
    
    Queue<Dog *> *dogQueue = [[Queue<Dog *> alloc] initWithArray:@[
        [[Dog alloc] initWithName:@"ポチ"],
        [[Dog alloc] initWithName:@"ワン吉"],
    ]];
    
    Queue<Cat *> *catQueue = [[Queue<Cat *> alloc] initWithArray:@[
        [[Cat alloc] initWithName:@"ニャン太"],
        [[Cat alloc] initWithName:@"みぃ"],
        [[Cat alloc] initWithName:@"ジジ"],
    ]];

    Handler<Animal *> *animalHandler = [[Handler<Animal *> alloc] initWithBlock:^(Animal *animal) {
        [animal stay];
    }];
    
    Handler<Dog *> *dogHandler = [[Handler<Dog *> alloc] initWithBlock:^(Dog *dog) {
        [dog bite];
    }];

//    Handler<Cat *> *catHandler = [[Handler<Cat *> alloc] initWithBlock:^(Cat *cat) {
//        [cat scratch];
//    }];
    
    [self handleNextAnimal:animalQueue animalHandler:animalHandler];
    [self handleNextDog:dogQueue dogHandler:dogHandler];

    // 共変性の確認
    
    // Queue<Animal *> の引数に Queue<Cat *> を渡しても OK
    [self handleNextAnimal:catQueue animalHandler:animalHandler];
    
    // Queue<Dog *> の引数に Queue<Animal *> を渡すのは NG
    // ⚠️incompatible pointer types sending 'Queue<Animal *> *' to parameter of type 'Queue<Dog *> *'
//    [self handleNextDog:animalQueue dogHandler:dogHandler];


    // 反変性の確認
    
    // Handler<Dog *> の引数に Handler<Animal *> を渡しても OK
    [self handleNextDog:dogQueue dogHandler:animalHandler];
    
    // Handler<Animal *> の引数に Handler<Cat *> を渡すのは NG
    // ⚠️incompatible pointer types sending 'Handler<Cat *> *' to parameter of type 'Handler<Animal *> *'
//    [self handleNextAnimal:animalQueue animalHandler:catHandler];
}

- (void)handleNextAnimal:(Queue<Animal *> *)animalQueue animalHandler:(Handler<Animal *> *)handler {
    NSLog(@"=== 次の動物を処理するぞ ===");
    Animal *animal = [animalQueue next];
    if (animal != nil) {
        [handler handle:animal];
    }
}

- (void)handleNextDog:(Queue<Dog *> *)dogQueue dogHandler:(Handler<Dog *> *)handler {
    NSLog(@"=== 次のイヌを処理するぞ ===");
    Dog *dog = [dogQueue next];
    if (dog != nil) {
        [handler handle:dog];
    }
}

@end
