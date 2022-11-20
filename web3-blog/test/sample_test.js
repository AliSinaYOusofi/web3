const {expect} = require("chai");
const {ethers} = require("hardhat");

describe("Blog", function () {
  // first test for the createPost function
  it("create a post", async function () {
    const Blog = await ethers.getContractFactory("Blog");
    const blog = await Blog.deploy("me blog");
    await blog.deployed();
    await blog.createPost("Posting the poster", "1222");
    
    const posts = await blog.fetchPosts();
    expect(posts[0].title).to.equal("Posting the poster");
  });

  it("should update the blog title", async function() {
    const Blog = await ethers.getContractFactory("Blog");
    const blog = await Blog.deploy("Me blog");
    await blog.deployed();

    expect(await blog.name()).to.equal("Me blog");
    await blog.updateName("Me New Blog");
    expect(await blog.name()).to.equal("Me New Blog");
  })
});