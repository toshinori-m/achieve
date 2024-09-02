module.exports = {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    screens: {
      sm: '500px',
      md: '846px',
      lg: '976px',
      xl: '1440px',
    },
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    function({ addUtilities }) {
      const newUtilities = {
        ".text-shadow": {
          textShadow: "0px 2px 3px lime"
        },
        ".text-shadow-b": {
          textShadow: "0px 2px 3px blue"
        },
        ".text-shadow-md": {
          textShadow: "0px 3px 3px lime"
        },
        ".text-shadow-md-b": {
          textShadow: "0px 3px 3px blue"
        },
        ".text-shadow-lg": {
          textShadow: "0px 5px 3px lime"
        },
        ".text-shadow-xl": {
          textShadow: "0px 7px 3px lime"
        },
        ".text-shadow-2xl": {
          textShadow: "0px 10px 3px lime"
        }
      };
      addUtilities(newUtilities);
    }],
}