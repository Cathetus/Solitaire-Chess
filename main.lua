require('game')

function love.load()
	game.load()
	game.shuffle(board)
end

function love.draw()
	game.draw()
end

--Space to shuffle the board
function love.keypressed(key, isrepeat)
	if key == " " then
		game.shuffle(board)
	end
end
