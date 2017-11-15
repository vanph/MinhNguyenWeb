using System.Collections.Generic;
using MyWeb.Models;

namespace MyWeb.Repositories
{
    public class ReviewRepository
    {
        private  List<RestaurantReview> _reviews;
        protected List<RestaurantReview> Reviews
        {
            get
            {
                if (_reviews == null)
                {
                    _reviews = new List<RestaurantReview>
                    {
                        new RestaurantReview {
                            Id = 1,
                            Name = "Cinnamon Club",
                            City="London",
                            Country="UK",
                            Rating = 10,
                        },
                        new RestaurantReview
                        {
                            Id = 2,
                            Name = "Marrakesh",
                            City = "D.C",
                            Country = "USA",
                            Rating = 8

                        },
                        new RestaurantReview
                        {
                            Id = 3,
                            Name = "The House of Elliot",
                            City = "Ghent",
                            Country = "Belgium",
                            Rating = 9
                        }
                    };
                }

                return _reviews;
            }
        }

        public List<RestaurantReview> GetReviews()
        {
            return Reviews;
        }
        
    }
}