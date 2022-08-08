using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TracerEX.Models
{
    public class Transaction
    {
        [Key]
        public int TransactionId { get; set; }

        [Range(1, int.MaxValue, ErrorMessage ="Please select a category.")]
        public int CategoryId { get; set; }
        public Category? Category { get; set; }//foreign key

        [Range(1, int.MaxValue, ErrorMessage = "Amount should not be null.")]
        public int Amount { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string? Note { get; set; }
        public DateTime Date { get; set; } = DateTime.Now;

        [NotMapped]
        public string? CategoryTitleWithIcong
        {
            get
            {
                return Category == null ? "" : Category.Icon + " " + Category.Title;
            }
        }
        [NotMapped]
        public string? FormattedAmount
        {
            get
            {
                return ((Category == null || Category.Type == "Expense") ? "-" :"+") + Amount.ToString("C0");
            }
        }

    }
}
