# 201: Swift Language Basics, Part 4: Challenge Instructions

## Everyone’s a Winner

In the game as it stands, once someone has won a game, or all positions are filled, there’s no way to restart the game and you have to kill the app and restart it. That’s not a great experience! In this challenge, you’re going to fix that.

First, you’re going to need a method in `ViewController` to reset the board. Call it `reset()`. You’ll need it to clear the turns and refresh the board.

Then you’re going to need a method that checks if there’s a win on the board. There’s a trick you can do to make this easier. A win can only happen after a player has just played. And the only person who can have just won, is the player who just played. Using this knowledge, create a method with this signature in `ViewController`:

    private func checkEnd(lastMove: (position: Position, player: Player))

This takes a tuple describing the last move – where the play was, and who played there. Inside this method, check if there is a win on the row where the play was. Then check if there is a win on the column where the row was. Finally, check if there’s a win on either diagonal.

If there was a win, then show an alert indicating who won. If there was not a win, but there are all 9 moves taken, then show an alert that nobody has won. On both these alerts, make it so that the refresh method you added previously gets called when the alert is dismissed.

Finally, in `board(board:didPressPosition:)`, call `checkEnd(lastMove:)` when the move has been played.

Good luck, and no peeking at the answer until you’ve finished it!