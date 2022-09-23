import { plus } from "../calc";

describe("plus test", () => {
  test("1 + 1", () => {
    expect(plus(1, 1)).toEqual(2);
  });
});