module.exports = {
  mode: 'jit',
  purge: [
    `${process.env.SRC_DIR}/**/*.html`,
    `${process.env.SRC_DIR}/R/*.R`
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
