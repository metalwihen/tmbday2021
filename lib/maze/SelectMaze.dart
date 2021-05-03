class SelectMaze {
  static final String mazeJson = """
  {
	"rows": 18,
	"cols": 18,
	"cells": [{
		"x": 0,
		"y": 0,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 1,
		"y": 0,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 2,
		"y": 0,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 3,
		"y": 0,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 4,
		"y": 0,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 5,
		"y": 0,
		"wallsUp": [true, false, false, false]
	}, {
		"x": 6,
		"y": 0,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 7,
		"y": 0,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 8,
		"y": 0,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 9,
		"y": 0,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 10,
		"y": 0,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 11,
		"y": 0,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 12,
		"y": 0,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 13,
		"y": 0,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 14,
		"y": 0,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 15,
		"y": 0,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 16,
		"y": 0,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 17,
		"y": 0,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 0,
		"y": 1,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 1,
		"y": 1,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 2,
		"y": 1,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 3,
		"y": 1,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 4,
		"y": 1,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 5,
		"y": 1,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 6,
		"y": 1,
		"type": "key2",
		"wallsUp": [true, false, true, true]
	}, {
		"x": 7,
		"y": 1,
		"type": "shark_land",
		"wallsUp": [true, false, true, false]
	}, {
		"x": 8,
		"y": 1,
		"type": "shark_land",
		"wallsUp": [true, false, true, false]
	}, {
		"x": 9,
		"y": 1,
		"type": "shark_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 10,
		"y": 1,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 11,
		"y": 1,
		"wallsUp": [false, true, true, true]
	}, {
		"x": 12,
		"y": 1,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 13,
		"y": 1,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 14,
		"y": 1,
		"wallsUp": [false, true, true, true]
	}, {
		"x": 15,
		"y": 1,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 16,
		"y": 1,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 17,
		"y": 1,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 0,
		"y": 2,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 1,
		"y": 2,
		"wallsUp": [false, false, true, false]
	}, {
		"x": 2,
		"y": 2,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 3,
		"y": 2,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 4,
		"y": 2,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 5,
		"y": 2,
		"wallsUp": [false, true, false, false]
	}, {
		"x": 6,
		"y": 2,
		"type": "shark_land",
		"wallsUp": [true, false, false, true]
	}, {
		"x": 7,
		"y": 2,
		"type": "shark_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 8,
		"y": 2,
		"type": "shark_land",
		"wallsUp": [true, false, false, true]
	}, {
		"x": 9,
		"y": 2,
		"type": "shark_land",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 10,
		"y": 2,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 11,
		"y": 2,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 12,
		"y": 2,
		"wallsUp": [false, true, false, false]
	}, {
		"x": 13,
		"y": 2,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 14,
		"y": 2,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 15,
		"y": 2,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 16,
		"y": 2,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 17,
		"y": 2,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 0,
		"y": 3,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 1,
		"y": 3,
		"wallsUp": [true, false, true, true]
	}, {
		"x": 2,
		"y": 3,
		"wallsUp": [false, true, false, false]
	}, {
		"x": 3,
		"y": 3,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 4,
		"y": 3,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 5,
		"y": 3,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 6,
		"y": 3,
		"type": "shark_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 7,
		"y": 3,
		"type": "shark_land",
		"wallsUp": [false, true, true, true]
	}, {
		"x": 8,
		"y": 3,
		"type": "shark_land",
		"wallsUp": [false, false, false, true]
	}, {
		"x": 9,
		"y": 3,
		"type": "shark_land",
		"wallsUp": [true, false, true, false]
	}, {
		"x": 10,
		"y": 3,
		"type": "shark_land",
		"wallsUp": [true, false, true, false]
	}, {
		"x": 11,
		"y": 3,
		"type": "shark_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 12,
		"y": 3,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 13,
		"y": 3,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 14,
		"y": 3,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 15,
		"y": 3,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 16,
		"y": 3,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 17,
		"y": 3,
		"wallsUp": [true, true, false, true]
	}, {
		"x": 0,
		"y": 4,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 1,
		"y": 4,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 2,
		"y": 4,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 3,
		"y": 4,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 4,
		"y": 4,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 5,
		"y": 4,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 6,
		"y": 4,
		"type": "shark_land",
		"wallsUp": [false, false, true, true]
	}, {
		"x": 7,
		"y": 4,
		"type": "shark_land",
		"wallsUp": [true, false, true, false]
	}, {
		"x": 8,
		"y": 4,
		"type": "shark_land",
		"wallsUp": [false, false, true, false]
	}, {
		"x": 9,
		"y": 4,
		"type": "shark_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 10,
		"y": 4,
		"type": "shark_land",
		"wallsUp": [true, true, false, true]
	}, {
		"x": 11,
		"y": 4,
		"type": "shark_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 12,
		"y": 4,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 13,
		"y": 4,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 14,
		"y": 4,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 15,
		"y": 4,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 16,
		"y": 4,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 17,
		"y": 4,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 0,
		"y": 5,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 1,
		"y": 5,
		"wallsUp": [false, true, false, false]
	}, {
		"x": 2,
		"y": 5,
		"wallsUp": [true, true, false, true]
	}, {
		"x": 3,
		"y": 5,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 4,
		"y": 5,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 5,
		"y": 5,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 6,
		"y": 5,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 7,
		"y": 5,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 8,
		"y": 5,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 9,
		"y": 5,
		"type": "shark_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 10,
		"y": 5,
		"type": "shark_land",
		"wallsUp": [false, false, true, true]
	}, {
		"x": 11,
		"y": 5,
		"type": "shark_land",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 12,
		"y": 5,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 13,
		"y": 5,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 14,
		"y": 5,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 15,
		"y": 5,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 16,
		"y": 5,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 17,
		"y": 5,
		"type": "key1",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 0,
		"y": 6,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 1,
		"y": 6,
		"wallsUp": [false, true, true, true]
	}, {
		"x": 2,
		"y": 6,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 3,
		"y": 6,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 4,
		"y": 6,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 5,
		"y": 6,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 6,
		"y": 6,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 7,
		"y": 6,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 8,
		"y": 6,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 9,
		"y": 6,
		"type": "shark_land",
		"wallsUp": [false, false, true, true]
	}, {
		"x": 10,
		"y": 6,
		"type": "shark_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 11,
		"y": 6,
		"wallsUp": [true, true, false, true]
	}, {
		"x": 12,
		"y": 6,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 13,
		"y": 6,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 14,
		"y": 6,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 15,
		"y": 6,
		"type": "fire_land",
		"wallsUp": [true, false, false, true]
	}, {
		"x": 16,
		"y": 6,
		"type": "fire_land",
		"wallsUp": [true, false, true, false]
	}, {
		"x": 17,
		"y": 6,
		"type": "fire_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 0,
		"y": 7,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 1,
		"y": 7,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 2,
		"y": 7,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 3,
		"y": 7,
		"wallsUp": [true, true, false, true]
	}, {
		"x": 4,
		"y": 7,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 5,
		"y": 7,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 6,
		"y": 7,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 7,
		"y": 7,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 8,
		"y": 7,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 9,
		"y": 7,
		"type": "shark_land",
		"wallsUp": [true, false, false, true]
	}, {
		"x": 10,
		"y": 7,
		"type": "shark_land",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 11,
		"y": 7,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 12,
		"y": 7,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 13,
		"y": 7,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 14,
		"y": 7,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 15,
		"y": 7,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 16,
		"y": 7,
		"type": "fire_land",
		"wallsUp": [true, true, false, true]
	}, {
		"x": 17,
		"y": 7,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 0,
		"y": 8,
		"wallsUp": [true, true, false, true]
	}, {
		"x": 1,
		"y": 8,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 2,
		"y": 8,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 3,
		"y": 8,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 4,
		"y": 8,
		"wallsUp": [true, false, false, false]
	}, {
		"x": 5,
		"y": 8,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 6,
		"y": 8,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 7,
		"y": 8,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 8,
		"y": 8,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 9,
		"y": 8,
		"type": "shark_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 10,
		"y": 8,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 11,
		"y": 8,
		"wallsUp": [false, true, false, false]
	}, {
		"x": 12,
		"y": 8,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 13,
		"y": 8,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 14,
		"y": 8,
		"type": "fire_land",
		"wallsUp": [false, false, true, true]
	}, {
		"x": 15,
		"y": 8,
		"type": "fire_land",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 16,
		"y": 8,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 17,
		"y": 8,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 0,
		"y": 9,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 1,
		"y": 9,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 2,
		"y": 9,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 3,
		"y": 9,
		"wallsUp": [false, true, false, false]
	}, {
		"x": 4,
		"y": 9,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 5,
		"y": 9,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 6,
		"y": 9,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 7,
		"y": 9,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 8,
		"y": 9,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 9,
		"y": 9,
		"type": "shark_land",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 10,
		"y": 9,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 11,
		"y": 9,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 12,
		"y": 9,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 13,
		"y": 9,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 14,
		"y": 9,
		"type": "fire_land",
		"wallsUp": [true, false, true, true]
	}, {
		"x": 15,
		"y": 9,
		"type": "fire_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 16,
		"y": 9,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 17,
		"y": 9,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 0,
		"y": 10,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 1,
		"y": 10,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 2,
		"y": 10,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 3,
		"y": 10,
		"wallsUp": [false, false, true, false]
	}, {
		"x": 4,
		"y": 10,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 5,
		"y": 10,
		"wallsUp": [false, true, true, true]
	}, {
		"x": 6,
		"y": 10,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 7,
		"y": 10,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 8,
		"y": 10,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 9,
		"y": 10,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 10,
		"y": 10,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 11,
		"y": 10,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 12,
		"y": 10,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 13,
		"y": 10,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 14,
		"y": 10,
		"type": "fire_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 15,
		"y": 10,
		"type": "fire_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 16,
		"y": 10,
		"type": "fire_land",
		"wallsUp": [false, false, true, true]
	}, {
		"x": 17,
		"y": 10,
		"type": "fire_land",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 0,
		"y": 11,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 1,
		"y": 11,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 2,
		"y": 11,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 3,
		"y": 11,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 4,
		"y": 11,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 5,
		"y": 11,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 6,
		"y": 11,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 7,
		"y": 11,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 8,
		"y": 11,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 9,
		"y": 11,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 10,
		"y": 11,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 11,
		"y": 11,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 12,
		"y": 11,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 13,
		"y": 11,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 14,
		"y": 11,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 15,
		"y": 11,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 16,
		"y": 11,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 17,
		"y": 11,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 0,
		"y": 12,
		"wallsUp": [true, true, false, true]
	}, {
		"x": 1,
		"y": 12,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 2,
		"y": 12,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 3,
		"y": 12,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 4,
		"y": 12,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 5,
		"y": 12,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 6,
		"y": 12,
		"wallsUp": [true, false, false, false]
	}, {
		"x": 7,
		"y": 12,
		"wallsUp": [true, false, false, false]
	}, {
		"x": 8,
		"y": 12,
		"wallsUp": [false, false, true, false]
	}, {
		"x": 9,
		"y": 12,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 10,
		"y": 12,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 11,
		"y": 12,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 12,
		"y": 12,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 13,
		"y": 12,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 14,
		"y": 12,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 15,
		"y": 12,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 16,
		"y": 12,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 17,
		"y": 12,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 0,
		"y": 13,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 1,
		"y": 13,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 2,
		"y": 13,
		"wallsUp": [true, false, true, true]
	}, {
		"x": 3,
		"y": 13,
		"wallsUp": [false, false, true, false]
	}, {
		"x": 4,
		"y": 13,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 5,
		"y": 13,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 6,
		"y": 13,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 7,
		"y": 13,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 8,
		"y": 13,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 9,
		"y": 13,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 10,
		"y": 13,
		"wallsUp": [true, false, true, true]
	}, {
		"x": 11,
		"y": 13,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 12,
		"y": 13,
		"wallsUp": [false, false, false, false]
	}, {
		"x": 13,
		"y": 13,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 14,
		"y": 13,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 15,
		"y": 13,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 16,
		"y": 13,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 17,
		"y": 13,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 0,
		"y": 14,
		"type": "ghost_land",
		"wallsUp": [true, false, false, true]
	}, {
		"x": 1,
		"y": 14,
		"type": "ghost_land",
		"wallsUp": [true, false, false, false]
	}, {
		"x": 2,
		"y": 14,
		"type": "ghost_land",
		"wallsUp": [true, false, true, false]
	}, {
		"x": 3,
		"y": 14,
		"wallsUp": [true, false, false, false]
	}, {
		"x": 4,
		"y": 14,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 5,
		"y": 14,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 6,
		"y": 14,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 7,
		"y": 14,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 8,
		"y": 14,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 9,
		"y": 14,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 10,
		"y": 14,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 11,
		"y": 14,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 12,
		"y": 14,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 13,
		"y": 14,
		"wallsUp": [true, false, true, true]
	}, {
		"x": 14,
		"y": 14,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 15,
		"y": 14,
		"wallsUp": [false, false, false, true]
	}, {
		"x": 16,
		"y": 14,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 17,
		"y": 14,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 0,
		"y": 15,
		"type": "ghost_land",
		"wallsUp": [false, true, true, true]
	}, {
		"x": 1,
		"y": 15,
		"type": "ghost_land",
		"wallsUp": [false, true, false, true]
	}, {
		"x": 2,
		"y": 15,
		"type": "normal_path",
		"wallsUp": [true, false, true, true]
	}, {
		"x": 3,
		"y": 15,
		"wallsUp": [false, false, true, false]
	}, {
		"x": 4,
		"y": 15,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 5,
		"y": 15,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 6,
		"y": 15,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 7,
		"y": 15,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 8,
		"y": 15,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 9,
		"y": 15,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 10,
		"y": 15,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 11,
		"y": 15,
		"wallsUp": [false, true, false, true]
	}, {
		"x": 12,
		"y": 15,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 13,
		"y": 15,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 14,
		"y": 15,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 15,
		"y": 15,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 16,
		"y": 15,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 17,
		"y": 15,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 0,
		"y": 16,
		"type": "ghost_land",
		"wallsUp": [true, false, false, true]
	}, {
		"x": 1,
		"y": 16,
		"type": "ghost_land",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 2,
		"y": 16,
		"type": "ghost_land",
		"wallsUp": [true, false, false, true]
	}, {
		"x": 3,
		"y": 16,
		"type": "ghost_land",
		"wallsUp": [true, true, false, false]
	}, {
		"x": 4,
		"y": 16,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 5,
		"y": 16,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 6,
		"y": 16,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 7,
		"y": 16,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 8,
		"y": 16,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 9,
		"y": 16,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 10,
		"y": 16,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 11,
		"y": 16,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 12,
		"y": 16,
		"wallsUp": [true, false, false, true]
	}, {
		"x": 13,
		"y": 16,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 14,
		"y": 16,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 15,
		"y": 16,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 16,
		"y": 16,
		"wallsUp": [true, false, false, false]
	}, {
		"x": 17,
		"y": 16,
		"wallsUp": [true, true, false, false]
	}, {
		"x": 0,
		"y": 17,
		"type": "ghost_land",
		"wallsUp": [false, false, true, true]
	}, {
		"x": 1,
		"y": 17,
		"type": "ghost_land",
		"wallsUp": [true, false, true, false]
	}, {
		"x": 2,
		"y": 17,
		"type": "ghost_land",
		"wallsUp": [false, true, true, false]
	}, {
		"x": 3,
		"y": 17,
		"type": "key3",
		"wallsUp": [false, true, true, true]
	}, {
		"x": 4,
		"y": 17,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 5,
		"y": 17,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 6,
		"y": 17,
		"wallsUp": [false, false, true, false]
	}, {
		"x": 7,
		"y": 17,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 8,
		"y": 17,
		"wallsUp": [true, true, true, false]
	}, {
		"x": 9,
		"y": 17,
		"wallsUp": [false, false, true, true]
	}, {
		"x": 10,
		"y": 17,
		"wallsUp": [false, false, true, false]
	}, {
		"x": 11,
		"y": 17,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 12,
		"y": 17,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 13,
		"y": 17,
		"wallsUp": [true, false, true, true]
	}, {
		"x": 14,
		"y": 17,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 15,
		"y": 17,
		"wallsUp": [true, false, true, false]
	}, {
		"x": 16,
		"y": 17,
		"wallsUp": [false, true, true, false]
	}, {
		"x": 17,
		"y": 17,
		"wallsUp": [false, true, true, true]
	}]
}
""";
}
