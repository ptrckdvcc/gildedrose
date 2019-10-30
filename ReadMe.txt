Readme

Project created with:
xCode 11.1
Swift 5

My approach consisted of:
1. extracting the requirements rules
2. writing black-box unit tests for the requirements
3. proceeding with incremental refactoring tested with the black-box unit tests


Refactoring Steps
- Extract logic for each item type from updateQuality() method.
- Run tests after each item logic was extracted
- Refactor the conditional code with strategy pattern
- Create a Strategy Factory to assign the correct strategy to each item


Requirements
Following is the logic extracted from the requirements.
After each quality update:

All
* quality >= 0

Normal
* sellIn -= 1
* quality -= 1
* if sellIn <= 0: quality -= 2
* quality < 50

Brie
* sellIn -= 1
* quality += 1
* quality < 50

Sulfura
* sellIn -= 0
* quality == 80

Backstage
* sellIn -= 1
* if sellIn > 10: quality -= 1
* if sellIn > 5 && sellIn <= 10: quality -= 2
* if sellIn > 0 && sellIn <= 5: quality -= 3
* if sellIn <= 0: quality = 0
* quality < 50

Conjured
* sellIn -= 1
* quality -= 2
* if sellIn <= 0: quality -= 4
* quality < 50


Further improvements
- Item could be a struct instead of a class. By using value semantics, code would be simpler and safer.
- ItemStrategy protocol could be decoupled from Item class, by using a protocol instead of Item class in functions arguments.
- The enum Names is now using hardcoded strings for item names. Such strings could be read from a configuration file. Such file could be edited without the need of rebuilding the app.
- Unit tests for each strategy could have been added to the tests suite. However, I decided not because they were too redundant with the already added black-box tests.


